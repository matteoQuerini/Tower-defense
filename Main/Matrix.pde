class Matrix{
  int colonne;
  int righe;
  int dimensioneCella;

  public Matrix(int colonne, int righe, int dimensioneCella){
    this.colonne = colonne;
    this.righe = righe;
    this.dimensioneCella = dimensioneCella;
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
    //Calcolo il centro della finestra
    int offsetX = (width - (colonne * dimensioneCella)) / 2;
    int offsetY = (height - (righe * dimensioneCella)) / 2;
    
    
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
  
  public int getCellCenterX(int col) {
    int offsetX = (width - (colonne * dimensioneCella)) / 2;
    return offsetX + col * dimensioneCella + dimensioneCella / 2;
  }
  
  
  public int getCellCenterY(int row) {
    int offsetY = (height - (righe * dimensioneCella)) / 2;
    return offsetY + row * dimensioneCella + dimensioneCella / 2;
  }
}
