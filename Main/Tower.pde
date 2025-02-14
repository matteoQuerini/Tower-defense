import java.util.ArrayList;

class Tower {
    int x;
    int y;
    int areaAttacco;
    ArrayList<Projectile> proiettili;
    
    //limite di proiettili per torre
    final int MAX_PROIETTILI = 20;

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
            proiettili.add(new Projectile(target, this.x, this.y, 30));
        }
    }
    
    public void mostraTorre(){
      //Imposto il colore della torre e la disegno
      fill(255, 0, 0);
      ellipse(getX(), getY(), 30, 30);
    }
}
