ArrayList<Tower> torri = new ArrayList<Tower>();
int counterTorriMax = 10;
Matrix griglia = new Matrix(10, 15, 45);
PImage sfondo;
boolean[][] celleOccupate;
int windowWidth = 1200;
int windowHeight = 800;



void settings() {
  //Crea la finestra con le dimensioni impostate(larghezza e altezza)
  //size(griglia.getColonne() * griglia.getDimensioneCella(), griglia.getRighe() * griglia.getDimensioneCella());
  size(windowWidth, windowHeight);

}


void setup() {
  sfondo = loadImage("background.png");
  celleOccupate = new boolean[griglia.getRighe()][griglia.getColonne()];
  griglia.disegnaGriglia();
}

void draw() {
  image(sfondo, 0, 0, width, height);
  griglia.disegnaGriglia();
  
  for(Tower torre : torri){
    if (torre != null){
      torre.mostraTorre();
    }
  }
}



void mousePressed(){
  
  //Calcola la distanza dai margini della finestra alla griglia per centrarla
  int offsetX = (width - griglia.getColonne() * griglia.getDimensioneCella()) / 2;
  int offsetY = (height - griglia.getRighe() * griglia.getDimensioneCella()) / 2;
  
  //Calcola le posizioni della cella considerando fli offset 
  int cellX = (mouseX - offsetX) / griglia.getDimensioneCella();
  int cellY = (mouseY - offsetY) / griglia.getDimensioneCella();
  
  cellX = constrain(cellX, 0, griglia.getColonne() - 1);
  cellY = constrain(cellY, 0, griglia.getRighe() - 1);
  
  if (celleOccupate[cellY][cellX] == false && torri.size() < counterTorriMax){
    
    //Calcolo il centro della cella
    int centerX = griglia.getCellCenterX(cellX);
    int centerY = griglia.getCellCenterY(cellY);

    torri.add(new Tower(centerX, centerY, 15, 100, 2.0));
    celleOccupate[cellY][cellX] = true;
    
  } else {
    println("Numero massimo di torri raggiunto!");
  }
}
