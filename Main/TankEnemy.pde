class TankEnemy extends Enemy{
    
  public TankEnemy(ArrayList<PVector> percorso){
        super(percorso);
        //piu vita meno veloce
        this.vita = 3500;
        this.velocita = 3f;
    }


    @Override
    public void mostraNemico(){
      //colore e dimensioni modificate  
      fill(255, 0, 0);
      ellipse(x, y, 35, 35);
    }
}
