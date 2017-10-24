class Pacman extends Agent {
  int mouthPos;
  int diam;
  boolean mouthClosing;

  PVector[] mouthFrame = {
    new PVector(PI/3, 5*PI/3),
    new PVector(PI/4, 7*PI/4),
    new PVector(0, 2*PI)
  };

  Pacman() {
    super(tileSize * numWidth / 2 - 1, tileSize * numHeight - 3 * tileSize);
    println(tileSize * numWidth / 2 + " " + tileSize * numHeight);
    speed = 3;
    diam = 18;
    mouthClosing = true;
    mouthPos = 0;
  }

  //called from Tile class
  void show(int x, int y) {
    int deg = 0;
    if (direction == "up") {
      deg = 270;
    } else if (direction == "left") {
      deg = 180;
    } else if (direction == "down") {
      deg = 90;
    }
    pushMatrix();
    translate(x, y);
    rotate(radians(deg));
    fill(230, 20, 147);
    arc(0, 0, diam, diam, mouthFrame[mouthPos].x, mouthFrame[mouthPos].y, PIE);
    popMatrix();
    mouthAnimation();
  }

  void mouthAnimation() {
    if (millis() > animationTimer + 75) {
      animationTimer = millis();
      mouthPos += (mouthClosing)? 1:-1;
      if (mouthPos <= 0) {
        mouthClosing = true;
      } else if (mouthPos >= 2) {
        mouthClosing = false;
      }
    }
  }
}
