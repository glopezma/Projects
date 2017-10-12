int score = 0;
int numWidth = 90;
int numHeight = 86;
int tileSize = 10;
int boardWidth = numWidth * tileSize;
int boardHeight = numHeight * tileSize;
Pacman pac;
Board board;

void setup() {
  size(900, 860);
  board = new Board();
  pac = new Pacman();
  smooth();
}

void draw() {
  background(51);
  board.update();
  board.show();
}

void keyPressed() {
  if (keyCode == LEFT) {
    // int xpos = pac.loc.x; 
    // if(xpos < 0) {
    //   xpos = 0;
    // }
    // if(xpos >= )
    pac.direction = "left";
    pac.setDir(-1, 0);
  } else if (keyCode == RIGHT) {
    pac.setDir(1, 0);
    pac.direction = "right";
  } else if (keyCode == UP) {
    pac.setDir(0, -1);
    pac.direction = "up";
  } else if (keyCode == DOWN) {
    pac.setDir(0, 1);
    pac.direction = "down";
  }
}

boolean inBounds(int x, int y) {
  return (x >= 0 && x < numWidth && y >= 0 && y < numHeight);
}
