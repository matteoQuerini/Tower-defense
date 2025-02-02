import java.util.ArrayList;

class Tower {
    int x;
    int y;
    int danno;
    int areaAttacco;
    float velocitaAttacco;
    ArrayList<Projectile> projectiles;

    public Tower(int x, int y, int danno, int areaAttacco, float velocitaAttacco) {
        this.x = x;
        this.y = y;
        this.danno = danno;
        this.areaAttacco = areaAttacco;
        this.velocitaAttacco = velocitaAttacco;
        projectiles = new ArrayList<Projectile>();
    }

    public void attacco(Enemy target) {
        if (target != null) {
            projectiles.add(new Projectile(danno, target));
        }
    }

    public void miglioramento() {
        danno += 5;
        areaAttacco += 10;
    }
}
