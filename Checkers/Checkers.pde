// Author: Gabriel Lopez
// Program: Checkers
// Date: 9/12/2017
// Description: This is checkers, the game we all grew up playing as kids!

Tile[][] board;      //The board we play on

ArrayList<Move> jumpList;      //all available moves
PVector cell = new PVector();  //Current move

color grey = color(200, 200, 200);
color red = color(255, 0, 0);
color black = color(0);
color white = color(255);

int boardSize = 800;
int tileSize = boardSize/8;
int rows = boardSize/tileSize;
int cols = boardSize/tileSize;

int greyCount = 12;    //how many red/grey peices are left. (end state when 0)
int redCount = 12;

color moveColor;  //The color of the peices that are allowed to move

boolean turn = true; //starts grey;
boolean firstClick = true; //checks if it's the first or second click of a move
boolean doubleJump = false;

void setup() {
  size(800, 800);
  board = new Tile[cols][rows];
  jumpList = new ArrayList<Move>();
  boardSetup();
}

void draw() {
  background(51);
  if (redCount != 0 && greyCount != 0) {
    moveColor = (turn)? grey: red;      //toggle turn
    if (!doubleJump) {
      jumpList = new ArrayList<Move>();   //reset the possible jump list
    }
    for (int i = 0; i<cols; i++) {
      for (int j = 0; j<rows; j++) {
        board[i][j].jumpSwitch = (hasJump(j, i))? true : false;
        board[i][j].show();
      }
    }
  } else {
    textSize(50);
    fill(moveColor); 
    String winnerString = (moveColor == red)? "red": "grey";
    text(winnerString+" Wins!!!", width/2.5, height/4);
    text("push space to restart", 175, height/4 + 100);
  }
}

//For all peices, check this and then make make player choose from there
boolean hasJump(int x, int y) {
  boolean returnStatement = false;
  color jumpColor = (board[y][x].pColor == grey)? red : grey;
  int bound = (board[y][x].pColor == grey)? 0 : 7;
  int dir = (board[y][x].pColor == grey)? -1: 1;

  if (jumpColor == moveColor || !board[y][x].occupied) {
    return returnStatement;
  }

  if (checkRight(x, y, dir, bound, jumpColor)) {//jump right
    returnStatement = true;
    if (!doubleJump) {
      addMove(y, x, y+2*dir, x+2);
    }
  }
  if (checkLeft(x, y, dir, bound, jumpColor)) {//jump left
    returnStatement = true;
    if (!doubleJump) {
      addMove(y, x, y+2*dir, x-2);
    }
  }
  if (board[y][x].isKing) {
    // println("X: "+x+" Y: "+y+" is King: "+board[y][x].isKing);
    dir = (board[y][x].pColor == grey)? 1: -1; //toggle the direction
    bound = (board[y][x].pColor == grey)? 7 : 0;
    if (checkRight(x, y, dir, bound, jumpColor)) {//jump right
      returnStatement = true;
      if (!doubleJump) {
        addMove(y, x, y+2*dir, x+2);
      }
    }
    if (checkLeft(x, y, dir, bound, jumpColor)) {//jump left
      returnStatement = true;
      if (!doubleJump) {
        addMove(y, x, y+2*dir, x-2);
      }
    }
  }
  return returnStatement;
}

boolean checkLeft(int x, int y, int dir, int bound, color jumpColor) {
  return(x - 2 >= 0 && abs(y-bound) > 1 && board[y+dir][x-1].occupied && board[y+dir][x-1].pColor == jumpColor && !board[y+dir*2][x-2].occupied);
}

boolean checkRight(int x, int y, int dir, int bound, color jumpColor) {
  return(x + 2 < 8 && abs(y-bound) > 1 && board[y+dir][x+1].occupied && board[y+dir][x+1].pColor == jumpColor && !board[y+dir*2][x+2].occupied);
}

void mousePressed() {
  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
      if (board[i][j].clickedOn() && firstClick && board[i][j].clickable()) {
        cell.x = j;
        cell.y = i;
        firstClick = false;
        board[i][j].highlight = true;
      } else if (!firstClick && board[i][j].clickedOn()) {
        if (!board[i][j].occupied && legal(int(cell.y), int(cell.x), i, j)) {
          if (!doubleJump) {
            turn = (turn)? false:true; //toggles who's turn it is
          }
        }
        board[i][j].crownKing();    //When called, only makes peice king if rules allow
        firstClick = doubleJump? false: true;
        board[int(cell.y)][int(cell.x)].highlight = false;
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    board = new Tile[cols][rows];
    jumpList = new ArrayList<Move>();
    greyCount = 12;    //how many red/grey peices are left. (end state when 0)
    redCount = 12;
    boardSetup();

    turn = true; //starts grey;
    firstClick = true; //checks if it's the first or second click of a move
    doubleJump = false;
  }
}

boolean legal(int oldy, int oldx, int newy, int newx) {
  if (jumpList.size() == 0 ) {
    if (legalMove(oldy, oldx, newy, newx)) {
      move(oldy, oldx, newy, newx);
      return true;
    }
  }
  if (makeJump(oldy, oldx, newy, newx)) {
    jumpList = new ArrayList<Move>();
    doubleJump = (hasJump(newx, newy))? true: false;
    if (doubleJump) {
      cell.x = newx;
      cell.y = newy;
    }
    return true;
  }
  return false;
}

boolean legalMove(int oldy, int oldx, int newy, int newx) {
  if (!board[oldy][oldx].isKing) {
    int dir = (board[oldy][oldx].pColor == red)? -1: 1;
    return (abs(oldx - newx) == 1 && oldy - newy == 1*dir);
  }
  return (abs(oldx - newx) == 1 && abs(oldy - newy) == 1);
}

void move(int oldy, int oldx, int newy, int newx) {
  board[newy][newx].occupied = true;
  board[newy][newx].pColor = board[oldy][oldx].pColor;
  board[newy][newx].isKing = board[oldy][oldx].isKing;

  board[oldy][oldx].reset();
}

// check to see if move is in jumpList
// carry out move
boolean makeJump(int oldy, int oldx, int newy, int newx) {
  Move currentMove;
  for (int i = 0; i<jumpList.size(); i++) {
    currentMove = new Move(jumpList.get(i));
    for (int j = 0; j<currentMove.end.size(); j++) {
      if (oldx == currentMove.start.x && oldy == currentMove.start.y && newx == currentMove.end.get(j).x && newy == currentMove.end.get(j).y) {
        jump(oldy, oldx, newy, newx);
        if (board[(newy + oldy)/2][(newx + oldx)/2].pColor == red) {
          redCount--;
        } else if (board[(newy + oldy)/2][(newx + oldx)/2].pColor == grey) {
          greyCount--;
        }
        return true;
      }
    }
  }
  return false;
}

void jump(int oldy, int oldx, int newy, int newx) {
  board[newy][newx].occupied = true;
  board[newy][newx].pColor = board[oldy][oldx].pColor;
  board[newy][newx].isKing = board[oldy][oldx].isKing;

  board[oldy][oldx].reset();
  board[(newy + oldy)/2][(newx + oldx)/2].reset();
}

void addMove(int y, int x, int newY, int newX) {
  jumpList.add(new Move());
  jumpList.get(jumpList.size()-1).start = new PVector(x, y);
  jumpList.get(jumpList.size()-1).end.add(new PVector(newX, newY));
}

void boardSetup() {
  color peiceColor = red;
  boolean visible = false;
  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
      peiceColor = (i>4)? grey: red;
      if (i < 3 || i > 4) {
        if (j!=0) {
          visible = (visible)? false: true;
        }
        if (i==5 && j==0) {
          visible = true;
        }
      } else {
        visible = false;
      }
      if (i%2 == 0) {
        board[i][j] = (j%2 == 1)?  new Tile(j, i, visible, black, peiceColor): new Tile(j, i, visible, white, peiceColor);
      } else {
        board[i][j] = (j%2 == 0)? new Tile(j, i, visible, black, peiceColor) : new Tile(j, i, visible, white, peiceColor);
      }
    }
  }
}