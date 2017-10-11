class Agent {
  PVector loc; 
  PVector dir;
  
  float speed; 
  
  Agent() {
    loc = new PVector(width/2, height/2);
    dir = new PVector(0, 0);
  }

  void setDir(int x, int y) {
    dir.set(x, y);
  }

  void move() {
    loc.add(PVector.mult(dir, 1.5));
  }
}