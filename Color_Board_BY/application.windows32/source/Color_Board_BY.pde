Board board;      
int boardSize = 450;
int tileSize = 50; 
int numTiles = 450 / 50; 
color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)}; 
color removeColor; 

void setup() {
  size(450, 550);
  board = new Board();
  println(numTiles); 
  removeColor = colors[int(random(0, 3))];
}

void draw() {
  background(removeColor);
  board.show();
  if (noColor(removeColor)) {
    color temp = removeColor; 
    while (temp == removeColor) {
      removeColor = colors[int(random(0, 3))];
    }
  }
  fill(255); 
  textSize(35); 
  text("Remove This Color", 10, 50);
}

boolean noColor(color myColor) {
  for (int i = 0; i < numTiles; i++) {
    for (int j = 0; j < numTiles; j++) {
      if (board.tiles[i][j].cColor == myColor) {
        return false;
      }
    }
  }
  return true;
}

void mousePressed() {
  board.click();
}