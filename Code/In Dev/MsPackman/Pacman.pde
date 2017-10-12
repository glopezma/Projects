class Pacman extends Agent {
  PVector[] mouthPos; 
  int diam; 
  Pacman() {
    super(tileSize * numWidth / 2, tileSize * numHeight - 4 * tileSize); //hard coded, I know. I'm terrible!
    println(tileSize * numWidth / 2 + " " + tileSize * numHeight); 
    speed = 3;
    diam = 18; 
  }

  void show(int x, int y) {  
    fill(230, 20, 147);
    ellipse(x, y, diam, diam);
  }
}