class Button{
    int x;
    int y;
    String testo;
    int altezza;
    int larghezza;

    Button(int x, int y, String testo, int altezza, int larghezza){
        this.x = x;
        this.y = y;
        this.testo = testo;
        this.altezza = altezza;
        this.larghezza = larghezza;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public String getTesto() {
        return testo;
    }

    public int getAltezza() {
        return altezza;
    }

    public int getLarghezza() {
        return larghezza;
    }

    public void disegnaBottone(int x, int y, int altezza, int larghezza){
        fill(251, 86, 7);
        rect(x, y, altezza, larghezza);
        fill(0);
        textAlign(CENTER, CENTER);
        text(getTesto(), getX() + getLarghezza() / 2, getY() + getAltezza() / 2);
    }


    boolean isPressed() {
        return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
    }
}