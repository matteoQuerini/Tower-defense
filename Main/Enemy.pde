class Enemy{
    int x;
    int y;
    float vita;
    float velocita;
    ArrayList<PVector> percorso;
    int posizioneCorrente;

    public Enemy(ArrayList<PVector> percorso){
        this.vita = 25;
        this.velocita = 3f;
        this.posizioneCorrente = 0;
        this.percorso = new ArrayList<PVector>(percorso);
        //prendo in primo punto del percorso calcolo le coordinate x e y e le assegno alle coordinate del nemico
        PVector start = this.percorso.get(0);
        this.x = (int)start.x;
        this.y = (int)start.y;
    }
    
    
   
   
   
    public void muovi(){
      //se la posizione attuale è maggiore all'ultima posizione del percorso esco
      if(posizioneCorrente >= percorso.size()){
        return;
      }
      
      //posioneTarget assume il valore del percorso in posizioneCorrente
      PVector posioneTarget = percorso.get(posizioneCorrente);
      //calcolo la distanza fra il nemiuco e la destinazione sia per le y sia per le x
      float distanzaX = posioneTarget.x - x;
      float distanzaY = posioneTarget.y - y;
      //calcolo la distanza effettiva con pitagora fla nemico e posizione
      //sqrt(x^2 + Y^2)
      float distanza = sqrt(distanzaX * distanzaX + distanzaY * distanzaY);
      
      
      if (distanza < velocita){
        posizioneCorrente++;
        
      } else {
        //calcola di quanto spostare il nemico e lo sposta lungo l'asse x e y secondo la velocita scelta
        x += distanzaX / distanza * velocita;
        y += distanzaY / distanza * velocita;
      }
}





    public void subisciDanno(float danno){
        vita -= danno;
        if (vita < 0) {
            vita = 0;
        }
    }



    public void mostraNemico(){
        fill(0, 255, 0);
        ellipse(x, y, 30, 30);
    }



    public int getX(){
        return x;
    }



    public void setX(int x){
        this.x = x;
    }



    public int getY(){
        return y;
    }



    public void setY(int y){
        this.y = y;
    }



    public float getVita(){
        return vita;
    }
    
    

    public void setVita(float vita){
        this.vita = vita;
    }
}
