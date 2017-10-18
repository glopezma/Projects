//This is the main file for createBoard

//These are all global so I can access them from anywhere. All my classes use these.
//If I wanted to change the board size, I just need to update this one variable.
int numWidth;     //number of tiles horizontally
int numHeight;    //number of tiles vertically
int tileSize;     //size of each tile
int boardWidth;   //the window width
int boardHeight;  //the window Height

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

//This is the loop that runs the game
void draw() {
  background(51); //draw the background (a gray color you don't see)
  board.show();   //The game board that I draw over the background.
}

//This is the even listener for key strokes.
void keyPressed() {
  board.action();
}

//this is just a global function that anything can call
//checks if an x and y variable are within the scope of the board. 
boolean inBounds(int x, int y) {
  return (x >= 0 && x < numWidth && y >= 0 && y < numHeight);
}
