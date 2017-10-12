class Tile {
  int x; 
  int y; 
  int tileSize = 20; 
  boolean bigFood; 
  boolean smallFood; 
  boolean wall; 
  boolean pac; 

  Tile(int x, int y) {
    this.x = x * tileSize; 
    this.y = y * tileSize; 
    bigFood = false; 
    smallFood = false; 
    wall = false; 
    //wall = (this.x == 0 || this.y == 0 || this.x == 30 || this.y == 34)? true:false; 
    pac = false;
  }

  void show(Pacman pac) {
    stroke(255, 255, 255, 25); 
    strokeWeight(1); 
    color mycolor = (wall)? color(68, 71, 76): color(0, 19, 56);  
    fill(mycolor);
    rect(x, y, tileSize, tileSize);
    println("x: " + x + " y: " + y); 
    pac.show(x, y); 
  }

  void show() {
    stroke(255, 255, 255, 25); 
    strokeWeight(1); 
    color mycolor = (wall)? color(68, 71, 76): color(0, 19, 56);  
    fill(mycolor);
    rect(x, y, tileSize, tileSize);
  }
}