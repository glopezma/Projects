class Tile {
  int x; 
  int y; 
  int cColor; 
  Tile(int x, int y) {
    this.x = x * tileSize; 
    this.y = y * tileSize + 100; 
    cColor = colors[int(random(0, 3))];
  }

  void show() {
    fill(200); 
    stroke(0); 
    strokeWeight(1); 
    rect(x, y, tileSize, tileSize); 
    fill(cColor); 
    noStroke(); 
    ellipse(x + tileSize / 2, y + tileSize / 2, tileSize - 10, tileSize - 10);
  }

  void click() {
    if (dist(x + tileSize / 2, y + tileSize / 2, mouseX, mouseY) <= (tileSize - 10) / 2) {
      color temp = cColor; 
      while (temp == cColor) {
        cColor = colors[int(random(0, 3))];
      }
    }
  }
}