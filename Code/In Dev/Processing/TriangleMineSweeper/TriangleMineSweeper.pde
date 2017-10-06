// Gabriel Lopez
// Triangle Mine Sweeper made from processing
// Oct 6, 2017

Board board; 
PVector mouse; 

void setup() {
  size(560, 560);
  board = new Board();
  mouse = new PVector(mouseX, mouseY); 
}

void draw() {
  background(51);
  mouse.set(mouseX, mouseY); 
  board.show(); 
}

void mousePressed() {
  board.action(); 
}