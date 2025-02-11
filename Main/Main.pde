import ddf.minim.*;





ArrayList<Tower> torri = new ArrayList<Tower>();

ArrayList<Enemy> nemici = new ArrayList<Enemy>();

int counterTorriMax = 10;

Matrix griglia;

PImage sfondo;

boolean[][] celleOccupate;

int windowWidth = 1200;

int windowHeight = 800;

Menu menu;

boolean giocoIniziato;

//oggetto Minim per la gestione della musica e suoni
Minim minim;

//oggetto AudioPlayer per caricare e riprodurre file audio
AudioPlayer player;



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
  
  
}











void transizione(){
  if(giocoIniziato){
    //Imposta lo sfondo scelto
    image(sfondo, 0, 0, width, height);
    griglia.disegnaGriglia();
    griglia.creaPercorso();
    generaOndata(1);
    
    for(Tower torre : torri){
      if (torre != null){
        torre.mostraTorre();
      }
    }

    for(Enemy nemico : nemici){
      if (nemico != null){
        nemico.muovi( );
        nemico.mostraNemico();
      }
    }

  } else {
    image(sfondo, 0, 0, width, height);
    menu.disegnaMenu();
    
  }
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
     
  
      torri.add(new Tower(centerX, centerY, 15, 100));
      celleOccupate[cellY][cellX] = true;
      
    } else {
      println("Numero massimo di torri raggiunto!");
    }
  }
}





public void generaOndata(int numeroNemici){
    ArrayList<PVector> percorso = griglia.getPercorso();
    for (int i = 0; i < numeroNemici; i++) {
        Enemy e = new Enemy(percorso);
        nemici.add(e);
    }
}





void stop(){
  //ferma la musica corrente
  player.close();
  
  //ferma l'oggetto miunim
  minim.stop();
  
  //ferma il programma chiamando il metodo stop della classe base di processing
  super.stop();
}
