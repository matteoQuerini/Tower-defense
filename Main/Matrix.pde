class Matrix{
  int colonne;
  int righe;
  int dimensioneCella;
  int offsetX;
  int offsetY;
  //PVector è un vettore contiene delle coordinate, direzione e lunghezza(con pitagora)
  ArrayList<PVector> puntiPercorso;

  public Matrix(int colonne, int righe, int dimensioneCella){
    this.colonne = colonne;
    this.righe = righe;
    this.dimensioneCella = dimensioneCella;
    //Calcolo il centro della finestra
    this.offsetX = (width - (colonne * dimensioneCella)) / 2;
    this.offsetY = (height - (righe * dimensioneCella)) / 2;
    
    puntiPercorso = new ArrayList<PVector>();
    generaPercorso();
  }
  
  private void generaPercorso(){
    //aggiungo a mano i punti dei percorso
     puntiPercorso.add(new PVector(0, 0));                    //start
     puntiPercorso.add(new PVector(6, 0));                    //destra
     puntiPercorso.add(new PVector(6, 3));                    //giu
     puntiPercorso.add(new PVector(9, 3));                    //Destra
     puntiPercorso.add(new PVector(9, 6));                    //giu
     puntiPercorso.add(new PVector(4, 6));                    //sinistra
     puntiPercorso.add(new PVector(4, 10));                   //giu
     puntiPercorso.add(new PVector(6, 10));                   //destra
     puntiPercorso.add(new PVector(6, 14));                   //giu
     puntiPercorso.add(new PVector(9, 14));                   //destra
     puntiPercorso.add(new PVector(9, this.righe - 1));       //fine
    }
  
  
  public ArrayList<PVector> getPuntiPercorso(){
    return this.puntiPercorso;
  }
  

  public int getColonne(){
    return colonne;
  }

  public int getRighe(){
    return righe;
  }

  public int getDimensioneCella(){
    return dimensioneCella;
  }

  void disegnaGriglia(){
    this.offsetX = (width - (colonne * dimensioneCella)) / 2;
    this.offsetY = (height - (righe * dimensioneCella)) / 2;
    
    
    for (int i = 0; i < colonne; i++){
      for (int j = 0; j < righe; j++){
        //Imposto il colore della cella: nero
        fill(0);
        
        //Imposto il colore del bordo delle celle: bianco
        stroke(255);
        
        //Calcolo la posizione della cella con l'aggiunta degli offset
        int x = offsetX + i * dimensioneCella;
        int y = offsetY + j * dimensioneCella;
        
        rect(x, y, dimensioneCella, dimensioneCella);
      }
    }
  }
  
  
  public ArrayList<PVector> getPercorso(){
    
        ArrayList<PVector> percorsoCentriCelle = new ArrayList<PVector>();
        
        //ciclo i vettori e calcolo i centri delle celle del percorso per poi far muoreve i nemici
        for(PVector nuovoVettore : puntiPercorso){
          
            //nuovoVettore.x e .y contengono le coordinate della colonna e della riga della griglia non in pixel ma in numeri interi
            //nel PVector i valori vengon memorizzati come dei float quindi faccio un cast
            //poi con getCenterX e Y della classe matrix converte una coordinata x o y in valori pixel
            int x = getCellCenterX((int)nuovoVettore.x);
            int y = getCellCenterY((int)nuovoVettore.y);
            percorsoCentriCelle.add(new PVector(x, y));
        }
        return percorsoCentriCelle;
 }
  
  
  
  
void creaPercorso(){
  int startX = 0;
  int startY = 0;
  int finishX = 15;
  int finishY = 10;

    for (int i = 0; i < colonne; i++){
        for (int j = 0; j < righe; j++){
            if (i == startX && j == startY){
                fill(255, 0, 0);
                
            } else if (i == finishX && j == finishY){
                fill(0, 0, 255);
                
            } else if (
                (j == 0 && i <= colonne - 5) ||
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

                fill(108, 108, 108);  //percorso
                
            } else {
                fill(0);  //cella libera
            }

            int x = offsetX + i * dimensioneCella;
            int y = offsetY + j * dimensioneCella;

            rect(x, y, dimensioneCella, dimensioneCella);
        }
    }
}


  //calcola la x di una specifica cella
  public int getCellCenterX(int col){
    //calcola lo spazio vuoto ai lati sinistro e destro per centrare la griglia
    int offsetX = (width - (colonne * dimensioneCella)) / 2;
    //calcola,la posizione x decentro della cella
    return offsetX + col * dimensioneCella + dimensioneCella / 2;
  }
  
  
  public int getCellCenterY(int row) {
    int offsetY = (height - (righe * dimensioneCella)) / 2;
    return offsetY + row * dimensioneCella + dimensioneCella / 2;
  }
}
