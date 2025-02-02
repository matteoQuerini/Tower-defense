class Enemy {
    int x;
    int y;
    float vita;
    float velocita;

    public Enemy(int x, int y, float vita, float velocita) {
        this.x = x;
        this.y = y;
        this.vita = vita;
        this.velocita = velocita;
    }

    public void subisciDanno(float danno) {
        vita -= danno;
        if (vita < 0) {
            vita = 0;
        }
    }
}
