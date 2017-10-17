class Agent {
  PVector loc;
  PVector dir;
  int animationTimer;
  float speed;
  String direction;

  Agent(int x, int y) {
    loc = new PVector(x, y);
    dir = new PVector(0, 0);
    animationTimer = millis();
    speed = 1;
    direction = "right"; 
  }

  void setDir(int x, int y) {
    dir.set(x, y);
  }

  void move() {
    loc.add(PVector.mult(dir, speed));
  }
}
