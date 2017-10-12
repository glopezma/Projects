Board board; 

void setup() {
  size(600, 640);
  board = new Board(); 
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
    board.pac.setDir(-1, 0);
  } else if (keyCode == RIGHT) {
    //println("go right"); 
    board.pac.setDir(1, 0);
  } else if (keyCode == UP) {
    //println("go up"); 
    board.pac.setDir(0, -1);
  } else if (keyCode == DOWN) {
    //println("go down"); 
    board.pac.setDir(0, 1);
  }
}