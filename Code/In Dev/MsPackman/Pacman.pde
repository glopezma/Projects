class Pacman extends Agent {
  PVector[] mouthPos; 
  Pacman() {
    super(20*29/2, 30*20+25/2); //hard coded, I know. I'm terrible!
    speed = 3.5; 
  }

  void show(int x, int y) {  
    fill(230, 20, 147);
    ellipse(x, y, 25, 25);
  }
}