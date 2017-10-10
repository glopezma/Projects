import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Checkers extends PApplet {

// Author: Gabriel Lopez
// Program: Checkers
// Date: 9/12/2017
// Description: This is checkers, the game we all grew up playing as kids!

Tile[][] board;      //The board we play on

ArrayList<Move> jumpList;      //all available moves
PVector cell = new PVector();  //Current move

int boardSize = 800;
int tileSize = boardSize/8;
int rows = boardSize/tileSize;
int cols = boardSize/tileSize;

int greyCount = 12;    //how many red/grey peices are left. (end state when 0)
int redCount = 12;

int moveColor;  //The color of the peices that are allowed to move

boolean turn = true; //starts grey;
boolean firstClick = true; //checks if it's the first or second click of a move
boolean doubleJump = false;

public void setup() {
  
  board = new Tile[cols][rows];
  jumpList = new ArrayList<Move>();
  boardSetup();
}

public void draw() {
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
    text(winnerString+" Wins!!!", width/2.5f, height/4);
    text("push space to restart", 175, height/4 + 100);
  }
}

//For all peices, check this and then make make player choose from there
public boolean hasJump(int x, int y) {
  boolean returnStatement = false;
  int jumpColor = (board[y][x].pColor == grey)? red : grey;
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

public boolean checkLeft(int x, int y, int dir, int bound, int jumpColor) {
  return(x - 2 >= 0 && abs(y-bound) > 1 && board[y+dir][x-1].occupied && board[y+dir][x-1].pColor == jumpColor && !board[y+dir*2][x-2].occupied);
}

public boolean checkRight(int x, int y, int dir, int bound, int jumpColor) {
  return(x + 2 < 8 && abs(y-bound) > 1 && board[y+dir][x+1].occupied && board[y+dir][x+1].pColor == jumpColor && !board[y+dir*2][x+2].occupied);
}

public void mousePressed() {
  for (int i = 0; i<cols; i++) {
    for (int j = 0; j<rows; j++) {
      if (board[i][j].clickedOn() && firstClick && board[i][j].clickable()) {
        cell.x = j;
        cell.y = i;
        firstClick = false;
        board[i][j].highlight = true;
      } else if (!firstClick && board[i][j].clickedOn()) {
        if (!board[i][j].occupied && legal(PApplet.parseInt(cell.y), PApplet.parseInt(cell.x), i, j)) {
          if (!doubleJump) {
            turn = (turn)? false:true; //toggles who's turn it is
          }
        }
        board[i][j].crownKing();    //When called, only makes peice king if rules allow
        firstClick = doubleJump? false: true;
        board[PApplet.parseInt(cell.y)][PApplet.parseInt(cell.x)].highlight = false;
      }
    }
  }
}

public void keyPressed() {
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

public boolean legal(int oldy, int oldx, int newy, int newx) {
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

public boolean legalMove(int oldy, int oldx, int newy, int newx) {
  if (!board[oldy][oldx].isKing) {
    int dir = (board[oldy][oldx].pColor == red)? -1: 1;
    return (abs(oldx - newx) == 1 && oldy - newy == 1*dir);
  }
  return (abs(oldx - newx) == 1 && abs(oldy - newy) == 1);
}

public void move(int oldy, int oldx, int newy, int newx) {
  board[newy][newx].occupied = true;
  board[newy][newx].pColor = board[oldy][oldx].pColor;
  board[newy][newx].isKing = board[oldy][oldx].isKing;

  board[oldy][oldx].reset();
}

// check to see if move is in jumpList
// carry out move
public boolean makeJump(int oldy, int oldx, int newy, int newx) {
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

public void jump(int oldy, int oldx, int newy, int newx) {
  board[newy][newx].occupied = true;
  board[newy][newx].pColor = board[oldy][oldx].pColor;
  board[newy][newx].isKing = board[oldy][oldx].isKing;

  board[oldy][oldx].reset();
  board[(newy + oldy)/2][(newx + oldx)/2].reset();
}

public void addMove(int y, int x, int newY, int newX) {
  jumpList.add(new Move());
  jumpList.get(jumpList.size()-1).start = new PVector(x, y);
  jumpList.get(jumpList.size()-1).end.add(new PVector(newX, newY));
}

public void boardSetup() {
  int peiceColor = red;
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
int grey = color(200, 200, 200);
int red = color(255, 0, 0);
int black = color(0);
int white = color(255);
class Move {
  PVector start; 
  ArrayList<PVector> end; 
  int points;
  
  Move(){
    start = new PVector(); 
    end = new ArrayList<PVector>(); 
    points = 0; 
  }
  
  Move(Move m) {
    start = m.start; 
    end = m.end; 
    points = m.points; 
  }
}
class Tile {
  int x;
  int y;

  boolean occupied;
  boolean highlight;
  boolean jumpSwitch;
  boolean isKing;

  int tColor;
  int pColor;
  int jumpColor;

  Tile(int xpos, int ypos, boolean occ, int tileColor, int peiceColor) {
    x = xpos;
    y = ypos;
    occupied = occ;
    highlight = false;
    isKing = false;
    jumpSwitch = false;
    tColor = tileColor;
    pColor = peiceColor;
    jumpColor = color(131, 234, 239, 30);
  }

  public void show() {
    if (highlight) {
      strokeWeight(5);
      stroke(255, 255, 0);
    }
    int fillColor = (jumpSwitch)? jumpColor: tColor;
    fill(fillColor);
    rect(x*tileSize, y*tileSize, tileSize, tileSize);
    strokeWeight(0);
    if (occupied) {
      fill(pColor);
      ellipse(x*tileSize+tileSize/2, y*tileSize+tileSize/2, tileSize/2, tileSize/2);
      if (isKing) {
        textSize(50);
        fill(0);
        text("k", x*tileSize+tileSize/2.5f, y*tileSize+tileSize/1.5f);
      }
    }
  }

  public void reset(){
    occupied = false;
    highlight = false;
    isKing = false;
    jumpSwitch = false;
  }

  public boolean clickedOn() {
    return (mouseX > this.x*tileSize && mouseX < this.x*tileSize+ tileSize && mouseY > this.y*tileSize && mouseY < this.y*tileSize+tileSize);
  }

  public boolean clickable() {
    return (this.pColor == moveColor && this.occupied);
  }

  public void crownKing() {
    if (this.pColor == grey && this.y == 0 || this.pColor == red && this.y == 7) {
      this.isKing = true; //move king over
    }
  }
}
//C:\Users\pl69798\AppData\Local\atom\bin
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Checkers" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
