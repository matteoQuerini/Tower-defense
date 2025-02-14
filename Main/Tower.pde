import java.util.ArrayList;

class Tower {
    int x;
    int y;
    int areaAttacco;
    ArrayList<Projectile> proiettili;
    
    //limite di proiettili per torre
    final int MAX_PROIETTILI = 15;
    final int DANNO_PROIETTILE = 15;

    public Tower(int x, int y, int areaAttacco){
        this.x = x;
        this.y = y;
        this.areaAttacco = areaAttacco;
        proiettili = new ArrayList<Projectile>();
    }
    
    public int getX(){
      return this.x;
    }
    
    
    public int getY(){
      return this.y;
    }
    
    public Enemy trovaBersaglio(ArrayList<Enemy> nemici){
      
        for(Enemy nemico : nemici){
            //calcolo se la distanza dal nemico alla torre è minore dell'area della torre
            if(dist(this.x, this.y, nemico.getX(), nemico.getY()) <= areaAttacco){
                //in caso ritorna il nemico nel range della torre
                return nemico;
            }
        }
        //altrimenti ritorna null
        return null;
    }

    public void attacco(Enemy target){
      
        if(target != null && proiettili.size() < this.MAX_PROIETTILI){
            proiettili.add(new Projectile(target, this.x, this.y, DANNO_PROIETTILE));
        }
    }
    
    public void mostraTorre(){

        //disegna l'area d'attacco della torre con un opacita del 20%
        //disegna una circonferenza senza riempirla
        noFill();
        //disegna il bordo della circonbferenza
        stroke(255, 0, 0, 50);
        //disegna la circonferenza (moltiplico per due per avere il diametro)
        ellipse(x, y, areaAttacco * 2, areaAttacco * 2);
        
        //disegna la torre
        fill(255, 0, 0);
        noStroke();
        ellipse(x, y, 30, 30);
    }
}
