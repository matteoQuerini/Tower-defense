class Matrix{
  int colonne;
  int righe;
  int dimensioneCella;
  int offsetX;
  int offsetY;
  ArrayList<Enemy> nemici;

  public Matrix(int colonne, int righe, int dimensioneCella){
    this.colonne = colonne;
    this.righe = righe;
    this.dimensioneCella = dimensioneCella;
    //Calcolo il centro della finestra
    this.offsetX = (width - (colonne * dimensioneCella)) / 2;
    this.offsetY = (height - (righe * dimensioneCella)) / 2;
    nemici = new ArrayList<>();
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


public void generaOndata(int numeroNemici){
  for (int i = 0; i < numeroNemici; i++) {
        // Calcola le coordinate (x, y) per ogni nemico
        int x = offsetX + i * 40; // Posiziona i nemici a 40 pixel di distanza l'uno dall'altro
        int y = offsetY;

        // Crea un nuovo nemico
        Enemy e = new Enemy(x, y, 10, 2.5f); // Vita = 10, Velocità = 2.5

        // Aggiungi il nemico alla lista
        nemici.add(e);

        // Disegna il nemico
        e.generaNemico();
        e.muovi(500, 500);
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
