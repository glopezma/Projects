class Agent {
  PVector loc;
  PVector dir;
  float speed; 

  Agent(int x, int y) {
    loc = new PVector(x, y);
    dir = new PVector(0, 0);
    speed = 1; 
  }

  void setDir(int x, int y) {
    dir.set(x, y);
  }

  void move() {
    loc.add(PVector.mult(dir, speed)); 
  }
}