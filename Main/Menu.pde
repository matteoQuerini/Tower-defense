class Menu{
  Button bottoneStart;
  Button bottoneEsci;
  String titolo;
  PFont fontTitolo;
  
   
  public Menu() {
    this.titolo = "Tower Defense";
    this.fontTitolo = createFont("Lucida Blackletter", 26);
    bottoneStart = new Button((width - 1100) / 2, (height - 500) / 2, "Start", 60, 150);
    bottoneEsci = new Button((width - 1100) / 2, (height - 350) / 2, "Esci", 60, 150);
  }
  
  
   public void disegnaMenu() {
    fill(99, 68, 48);
    rect(30, 90, 190, 220, 20);
    
    textFont(fontTitolo);
    fill(255);
    text(titolo, 40, 130);
    
    bottoneStart.disegnaBottone();
    bottoneEsci.disegnaBottone();
  }
  
  
  
  
  
}
