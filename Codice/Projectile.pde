public class Projectile{
    int danno;
    final float velocita;
    Enemy bersaglio;

    public Projectile(int danno, Enemy bersaglio){
        this.danno = danno;
        this.bersaglio = bersaglio;
    }

    public void movimento(){

    }
    
    public void obiettivoDaColpire() {
        if (bersaglio != null) {
            bersaglio.subisciDanno(danno);
        }
    }

}