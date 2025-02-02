import java.util.ArrayList;

public class Tower{
    int x;
    int y;
    int danno;
    int areaAttacco;
    float velocitaAttacco;
    ArrayList<Projectile> projectiles;

    public Tower(int x, int y, int danno, int areaAttacco, int velocitaAttacco){
        this.x = x;
        this.y = y;
        this.danno = danno;
        this.areaAttacco = areaAttacco;
        this.velocitaAttacco = velocitaAttacco;
        projectiles = new ArrayList<projectiles>();

    }

    public void attacco(Enemy target){
        if(target != null){
            projectiles.add(new Projectile(danno, target));
        }
    }

    public void miglioramento(){
        damage += 5;
        range += 10;
    }

}