
class Projectile {
    int danno;
    final float velocita = 10;
    Enemy bersaglio;

    public Projectile(int danno, Enemy bersaglio){
        this.danno = danno;
        this.bersaglio = bersaglio;
    }

    public void movimento(){

    }

    public void obiettivoDaColpire(){
        if (bersaglio != null) {
            bersaglio.subisciDanno(danno);
        }
    }
}
