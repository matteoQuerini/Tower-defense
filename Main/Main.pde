/*Tower tower;
Enemy enemy;

void setup() {
  size(800, 600);
  
  // Crea la torre
  tower = new Tower(400, 300, 20, 100, 2.0);
  
  // Crea un nemico
  enemy = new Enemy(600, 300, 100, 1.0);
}

void draw() {
  background(200);

  // Mostra la torre
  fill(255, 0, 0);
  ellipse(tower.x, tower.y, 30, 30);  // Posizione della torre
  
  // Mostra il nemico
  fill(0, 0, 255);
  ellipse(enemy.x, enemy.y, 30, 30);  // Posizione del nemico
  
  // Il nemico si muove verso sinistra
  enemy.x -= enemy.velocita;
  
  // La torre attacca quando il nemico entra nel suo range
  if (dist(tower.x, tower.y, enemy.x, enemy.y) < tower.areaAttacco) {
    tower.attacco(enemy);  // La torre spara al nemico
  }
  
  // Mostra i proiettili e fai loro colpire il nemico
  for (int i = 0; i < tower.projectiles.size(); i++) {
    Projectile p = tower.projectiles.get(i);
    
    // Movimento del proiettile (semplificato)
    p.bersaglio.x -= p.velocita;
    
    // Mostra il proiettile
    fill(0, 255, 0);
    ellipse(p.bersaglio.x, p.bersaglio.y, 10, 10);
    
    // Colpisce il nemico
    p.obiettivoDaColpire();
  }
  
  // Mostra la vita del nemico
  fill(0);
  text("Vita nemico: " + enemy.vita, 10, 20);
  
  // Se il nemico ha zero vita, fermalo
  if (enemy.vita <= 0) {
    enemy.velocita = 0;
    text("Nemico distrutto!", 10, 40);
  }
}

// Funzione che viene chiamata quando premi un tasto per migliorare la torre
void keyPressed() {
  tower.miglioramento();
}
*/

ArrayList<Tower> torri = new ArrayList<Tower>();

int colonne = 25;
int righe = 15;
int dimensioneCella = 45;



void settings() {
  //Crea la finestra con le dimensioni impostate(larghezza e altezza)
  size(colonne * dimensioneCella, righe * dimensioneCella);
}


void setup() {
  disegnaGriglia();
}

void draw() {
  background(255); 
  disegnaGriglia();
  
  for(Tower torre : torri){
    if (torre != null){
      torre.mostraTorre();
    }
  }
}




void disegnaGriglia() {
  for (int i = 0; i < colonne; i++) {
    for (int j = 0; j < righe; j++) {
      //Calcola e disegna la cella
      int x = i * dimensioneCella;
      int y = j * dimensioneCella;
      rect(x, y, dimensioneCella, dimensioneCella);
    }
  }
}


void mousePressed() {
  int cellX = mouseX / dimensioneCella;
  int cellY = mouseY / dimensioneCella;
  int centerX = cellX * dimensioneCella + dimensioneCella / 2;
  int centerY = cellY * dimensioneCella + dimensioneCella / 2;
  
  torri.add(new Tower(centerX, centerY, 15, 100, 2.0));
}
