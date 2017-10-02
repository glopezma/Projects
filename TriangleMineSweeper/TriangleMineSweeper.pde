// Gabriel Lopez
// Triangle Mine Sweeper made from processing
// Sep 29, 2017

// Every time you win the game, it'll send a congradulations and
// make it a little harder for the next game. 

Board board; 

void setup() {
  size(560, 560);
  board = new Board(); 
}


void draw() {
  background(255);
  if (!board.win()) {
    board.showPlay(); 
  } else {
    board.showEnd(); 
  }
}


void mousePressed() {
  board.action(); 
}