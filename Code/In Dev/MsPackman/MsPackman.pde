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
    //println("go left"); 
    pac.setDir(-1, 0);
  } else if (keyCode == RIGHT) {
    //println("go right"); 
    pac.setDir(1, 0);
  } else if (keyCode == UP) {
    //println("go up"); 
    pac.setDir(0, -1);
  } else if (keyCode == DOWN) {
    //println("go down"); 
    pac.setDir(0, 1);
  }
}