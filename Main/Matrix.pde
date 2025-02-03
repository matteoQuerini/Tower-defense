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
    for (int i = 0; i < colonne; i++){
      for (int j = 0; j < righe; j++){
        int x = i * dimensioneCella;
        int y = j * dimensioneCella;
        rect(x, y, dimensioneCella, dimensioneCella);
      }
    }
  }
}
