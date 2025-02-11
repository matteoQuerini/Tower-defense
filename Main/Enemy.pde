class Enemy{
    int x;
    int y;
    float vita;
    float velocita;

    public Enemy(int x, int y, float vita, float velocita){
        this.x = x;
        this.y = y;
        this.vita = vita;
        this.velocita = velocita;
    }

    public void muovi(int destinazioneX, int destinazioneY){
        float divezioneX = destinazioneX - x;
        float direzioneY = destinazioneY - y;
    }

    public void subisciDanno(float danno){
        vita -= danno;
        if (vita < 0) {
            vita = 0;
        }
    }

    public void generaNemico(){
        fill(0, 255, 0);
        ellipse(x, y, 30, 30);
    }

    // Getter e Setter
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

    public float getVelocita(){
        return velocita;
    }

    public void setVelocita(float velocita){
        this.velocita = velocita;
    }
}
