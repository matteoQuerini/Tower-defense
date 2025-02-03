import java.util.ArrayList;

class Tower {
    int x;
    int y;
    int danno;
    int areaAttacco;
    float velocitaAttacco;
    ArrayList<Projectile> proiettili;

    public Tower(int x, int y, int danno, int areaAttacco, float velocitaAttacco) {
        this.x = x;
        this.y = y;
        this.danno = danno;
        this.areaAttacco = areaAttacco;
        this.velocitaAttacco = velocitaAttacco;
        proiettili = new ArrayList<Projectile>();
    }
    
    public int getX(){
      return this.x;
    }
    
    
    public int getY(){
      return this.y;
    }

    public void attacco(Enemy target) {
        if (target != null) {
            proiettili.add(new Projectile(danno, target));
        }
    }

    public void miglioramento() {
        danno += 5;
        areaAttacco += 10;
    }
    
    public void mostraTorre(){
      //Imposto il colore della torre
      fill(255, 0, 0);
      ellipse(getX(), getY(), 30, 30);
      //reimposto il colore originale bianco
      fill(255, 255, 255);
    }
}
