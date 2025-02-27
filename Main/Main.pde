//libreria per gestire l'audio
import ddf.minim.*;





//ArrayList dei nemici e torri ed numaro massimo di torri posizionabuli
ArrayList<Tower> torri = new ArrayList<Tower>();
ArrayList<Enemy> nemici = new ArrayList<Enemy>();
int counterTorriMax = 10;

//gliglia visiva e logica e immagine di sfondo
Matrix griglia;
boolean[][] celleOccupate;
PImage sfondo;

//dimensione finestra
int windowWidth = 1200;
int windowHeight = 800;

//gestione menu e diversi stati dei gioco
Menu menu;
boolean giocoIniziato;
boolean nemiciCreati = false;
int counterNemiciCreati = 0;

//gestione della generazione dei nemici 
int spawnDelay = 30;
int spawnTimer = 0;
int nemiciTotali = 200;

int vite = 3;
final int AREA_ATTACCO_TORRI = 70;

//gestione audio
//oggetto Minim per la gestione della musica e suoni
Minim minim;
//oggetto AudioPlayer per caricare e riprodurre file audio
AudioPlayer player;
boolean musicaGameOverOn = false;



void settings(){
  //Crea la finestra con le dimensioni impostate(larghezza e altezza)
  size(windowWidth, windowHeight);

}




void setup(){
  griglia  = new Matrix(10, 15, 45);
  
  sfondo = loadImage("backgroundStart.jpg");
  menu = new Menu();
  giocoIniziato = false;
  
  //inizializza la libreria Minim per caricare e gestire la musica
  minim = new Minim(this);
  player = minim.loadFile("musicaStart.mp3");
  player.loop();
}




void draw(){
  
   transizione();
   
  if(controlloPerdita()){
       if(!musicaGameOverOn){
           player.close();
           player = minim.loadFile("musicaGameOver.mp3");
           player.loop();
           musicaGameOverOn = true;
       }
       schermataGameOver();
   }
}











void transizione(){
  
  //controlla sia che il gioco sia iniziato e anche se il percorso sia stato creato in modo che non ricrea un altro pewrcorso
  if(giocoIniziato){
  //fase di gioco
    assegnaPercorsoMatrice();
    //Imposta lo sfondo scelto
    image(sfondo, 0, 0, width, height);
    griglia.disegnaGriglia();
    griglia.creaPercorso();
    
    gestioneTorri();
    

    gestioneNemici();
    
    

  } else {
  //fase di menu
    image(sfondo, 0, 0, width, height);
    menu.disegnaMenu();
    
  }
}





void schermataGameOver(){
    background(0);
    sfondo = loadImage("backgroundGameOver.jpg");
    image(sfondo, 0, 0, width, height);
    menu.bottoneEsci.disegnaBottone();
}






//Funsiore predefinita di processing che viene richiamata ogni volta che si preme il tasto del mouse
void mousePressed(){
  
  //controllo anche se il gioco è iniziato alrtimenti posso prepere all'infinito il bottone anche se invisibile
  if(!giocoIniziato && menu.bottoneStart.isPressed()){
  
    //Carica lo sfondo di gioco
    sfondo = loadImage("backgroundGame.png");
    celleOccupate = new boolean[griglia.getRighe()][griglia.getColonne()];
    griglia.disegnaGriglia();
    giocoIniziato = true;
    
    player.close(); //chiude il player corrente
    player = minim.loadFile("musicaGame.mp3");
    player.loop(); //avvia la nuova musica
    
    
  } else if(menu.bottoneEsci.isPressed()){
    exit();
    
  }

  
  if(giocoIniziato){
    //Calcola la distanza dai margini della finestra alla griglia per centrarla
    int offsetX = (width - griglia.getColonne() * griglia.getDimensioneCella()) / 2;
    int offsetY = (height - griglia.getRighe() * griglia.getDimensioneCella()) / 2;
    
    //Calcola le posizioni della cella considerando fli offset 
    int cellX = (mouseX - offsetX) / griglia.getDimensioneCella();
    int cellY = (mouseY - offsetY) / griglia.getDimensioneCella();
    
    cellX = constrain(cellX, 0, griglia.getColonne() - 1);
    cellY = constrain(cellY, 0, griglia.getRighe() - 1);
    
    if(celleOccupate[cellY][cellX] == false && torri.size() < counterTorriMax){
      
      //Calcolo il centro della cella per assegnare la posizione alla torre
      int centerX = griglia.getCellCenterX(cellX);
      int centerY = griglia.getCellCenterY(cellY);
     
  
      torri.add(new Tower(centerX, centerY, AREA_ATTACCO_TORRI));
      celleOccupate[cellY][cellX] = true;
      
    } else {
      println("Numero massimo di torri raggiunto!");
    }
  }
}




public void assegnaPercorsoMatrice(){
  int colonne = griglia.getColonne();
  int righe = griglia.getRighe();
  
  for (int i = 0; i < colonne; i++){
    for (int j = 0; j < righe; j++){
      //uso le stesse condizini della funzione creaPercorso di matrix e  se sono reispettate assegno
      //alla matrice che tiene traccia delle celle occupate il valore true per poi controllare dove
      //posso posizionare le torri
      
      if((j == 0 && i <= colonne - 5) ||
          (i == colonne - 4 && j <= 3) ||
          (j == 3 && i >= colonne - 4) ||
          (i == colonne - 1 && j >= 3 && j <= 6) ||
          (j == 6 && i >= 4 && i <= colonne - 1) ||
          (i == 4 && j >= 6 && j <= 10) ||
          (j == 10 && i >= 4 && i <= 6) ||
          (i == 6 && j >= 10 && j <= 14) ||
          (j == 14 && i >= 6 && i <= 9) ||
          (i == 9 && j >= 14 && j <= 18) ||
          (j == 18 && i >= 9)){

            
        celleOccupate[j][i] = true;
      }
    }
  }
}




public void gestioneTorri(){
  for(Tower torre : torri){
      if(torre != null){
        torre.mostraTorre();
        Enemy target = torre.trovaBersaglio(nemici);
        
        //se esisteb lo attacco
        if(target != null){
          torre.attacco(target);
         }
         
         
         for(int i = torre.proiettili.size() - 1; i >= 0; i--){
                Projectile p = torre.proiettili.get(i);
                p.movimento();
                
                if(p.daRimuovere){
                    torre.proiettili.remove(i);
                }
        }
        
      }
    }
}






//controlla lla generazione, spawn e spostamento dei nemici per il percorso
void gestioneNemici(){
    gestisciSpawn();
    muoviNemici();
}





void gestisciSpawn(){
    spawnTimer++;
    //questa funzione viene richiamate in gestione nemici che a sua volta viene richiamata nella funzione draw
    //essendo che la funzione draw viene richiamata 60 volte al secondo la variabile spawnTimer incrementa ogni volta
    //fino ad arrivare a 30 ed aggiunge un nuovo nemico
    //non si puo usare un delay perche altrimenti i nemici verrebbero generati contemporaneamente e si muoverebbero a scatti
    if(spawnTimer >= spawnDelay && nemiciTotali > 0){
      Enemy e;
      
      
      if(random(1) < 0.5){
        e = new TankEnemy(griglia.getPercorso());
      
      } else {
        e = new FastEnemy(griglia.getPercorso());
      }


      nemici.add(e);
      nemiciTotali--;
      //dopo aver creato un nemico azzero lo spawnTimer per riaspettare altri 30 secondi
      spawnTimer = 0;
    }
}





void muoviNemici(){
    for(Enemy nemico : nemici){
        nemico.muovi();
        nemico.mostraNemico();

        if(nemico.haRaggiuntoFine()) {
            nemici.remove(nemico);
            vite--;
            break;
            
        } else if(nemico.eMorto()){
          nemici.remove(nemico);
          break;
        }
    }
}

boolean controlloPerdita(){
    return vite <= 0;
}
