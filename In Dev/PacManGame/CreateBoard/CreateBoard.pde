int numWidth;
int numHeight;
int tileSize;
int boardWidth;
int boardHeight;

Board board;

void setup() {
  size(890, 860);
  numWidth = 89;
  numHeight = 86;
  tileSize = 10;
  boardWidth = numWidth * tileSize;
  boardHeight = numHeight * tileSize;

  board = new Board();
}

void draw() {
  background(51);
  board.show();
}

boolean inBounds(int x, int y) {
  return (x >= 0 && x < numWidth && y >= 0 && y < numHeight);
}
