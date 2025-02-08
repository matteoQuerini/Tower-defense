import ddf.minim.*;

ArrayList<Tower> torri = new ArrayList<Tower>();
int counterTorriMax = 10;
Matrix griglia = new Matrix(10, 15, 45);
PImage sfondo;
boolean[][] celleOccupate;
int windowWidth = 1200;
int windowHeight = 800;
Button bottone;
boolean giocoIniziato;

//oggetto Minim per la gestione della musica e suoni
Minim minim;
//oggetto AudioPlayer per caricare e riprodurre file audio
AudioPlayer player;



void settings() {
  //Crea la finestra con le dimensioni impostate(larghezza e altezza)
  size(windowWidth, windowHeight);

}


void setup(){
  
  sfondo = loadImage("backgroundStart.jpg");
  
  //Centra il bottone in mezzo allo schermo
  bottone = new Button((width - 200) / 2, (height - 80) / 2, "Start", 60, 150);
  
  giocoIniziato = false;
  
  //inizializza la libreria Minim per caricare e gestire la musica
  minim = new Minim(this);
  player = minim.loadFile("musicaStart.mp3");
  player.loop();
}

void draw() {
  
   transizione();
  
  
}

void transizione(){
  if(giocoIniziato){
    //Imposta lo sfondo scelto
    image(sfondo, 0, 0, width, height);
    griglia.disegnaGriglia();
    
    
    for(Tower torre : torri){
      if (torre != null){
        torre.mostraTorre();
      }
    }
    
  } else {
    image(sfondo, 0, 0, width, height);
    bottone.disegnaBottone();
    
  }
}


//Funsiore predefinita di processing che viene richiamata ogni volta che si preme il tasto del mouse
void mousePressed(){
  
  //controllo anche se il gioco è iniziato alrtimenti posso prepere all'infinito il bottone anche se invisibile
  if(!giocoIniziato && bottone.isPressed()){
  
    //Carica lo sfondo di gioco
    sfondo = loadImage("backgroundGame.png");
    celleOccupate = new boolean[griglia.getRighe()][griglia.getColonne()];
    griglia.disegnaGriglia();
    giocoIniziato = true;
    
    player.close(); //chiude il player corrente
    player = minim.loadFile("musicaGame.mp3");
    player.loop(); //avvia la nuova musica
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
    
    if (celleOccupate[cellY][cellX] == false && torri.size() < counterTorriMax){
      
      //Calcolo il centro della cella per assegnare la posizione alla torre
      int centerX = griglia.getCellCenterX(cellX);
      int centerY = griglia.getCellCenterY(cellY);
     
  
      torri.add(new Tower(centerX, centerY, 15, 100, 2.0));
      celleOccupate[cellY][cellX] = true;
      
    } else {
      println("Numero massimo di torri raggiunto!");
    }
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
