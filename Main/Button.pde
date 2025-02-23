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

    public void disegnaBottone(){
        fill(0);
        //l'ultimo parametro serve per smussare il rettangolo
        rect(getX(), getY(), getLarghezza(), getAltezza(), 200);
        
        fill(255);
        textSize(35);
        text(getTesto(), getX() + getLarghezza() / 4, getY() + getAltezza() / 1.5);
        
    }


    boolean isPressed() {
        return (((mouseX > getX()) && (mouseX < getX() + getLarghezza()) && (mouseY > getY()) && (mouseY < getY() + getAltezza()));
    }
}
