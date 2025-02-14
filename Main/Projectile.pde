
class Projectile {
    int danno;
    final float velocita = 10;
    Enemy bersaglio;
    int x;
    int y;
    boolean daRimuovere = false;    

    public Projectile(Enemy bersaglio, int x, int y, int danno){
        this.danno = danno;
        this.bersaglio = bersaglio;
        this.x = x;
        this.y = y;
    }
    
    
    public boolean nemicoMorto(){
      return bersaglio == null || bersaglio.getVita() <= 0;
    }
    

    public void movimento(){
        if(nemicoMorto()){
            daRimuovere = true;
            return;
        }
        
        float distanzaX = bersaglio.getX() - x;
        float distanzaY = bersaglio.getY() - y;
        float distanzaTotale = sqrt(distanzaX * distanzaX + distanzaY * distanzaY);
        
        if(distanzaTotale > 0){
            x += (distanzaX / distanzaTotale) * velocita;
            y += (distanzaY / distanzaTotale) * velocita;
        }
        
        if(distanzaTotale < velocita){
            obiettivoDaColpire();
            daRimuovere = true;
        }
    }

    public void obiettivoDaColpire(){
        if (bersaglio != null) {
            bersaglio.subisciDanno(danno);
        }
    }
}
