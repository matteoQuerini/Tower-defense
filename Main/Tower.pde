import java.util.ArrayList;

class Tower {
    int x;
    int y;
    int danno;
    int areaAttacco;
    ArrayList<Projectile> proiettili;

    public Tower(int x, int y, int danno, int areaAttacco){
        this.x = x;
        this.y = y;
        this.danno = danno;
        this.areaAttacco = areaAttacco;
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
    
    public void mostraTorre(){
      //Imposto il colore della torre
      fill(255, 0, 0);
      ellipse(getX(), getY(), 30, 30);
    }
}
