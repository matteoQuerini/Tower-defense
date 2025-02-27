class FastEnemy extends Enemy{
    
  public FastEnemy(ArrayList<PVector> percorso) {
        super(percorso);
        //meno vota piu veloce
        this.vita = 400;
        this.velocita = 7f;
    }



    @Override
    public void subisciDanno(float danno){
      //meno resistente hai danni
      super.subisciDanno(danno * 1.2f);
    }



    @Override
    public void mostraNemico() {
      //colore e dimensioni modificate
      fill(0, 0, 255);
      rect(x - 15, y - 15, 30, 30);
    }
}
