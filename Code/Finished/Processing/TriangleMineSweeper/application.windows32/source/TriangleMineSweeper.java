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

public class TriangleMineSweeper extends PApplet {

// Gabriel Lopez
// Triangle Mine Sweeper made from processing
// Oct 6, 2017

Board board; 
PVector mouse; //In theory this should be in the game class. 

public void setup() {
  
  board = new Board();
  mouse = new PVector(mouseX, mouseY); 
}

public void draw() {
  background(51);
  mouse.set(mouseX, mouseY); 
  board.show(); 
}

public void mousePressed() {
  board.action(); 
}
class Board {
  int boardSize = 640;
  int numMines = 45;
  int tileSize = 40;
  int boardWidth = 2 * (boardSize/tileSize) - 1;
  int boardHeight = (boardSize/tileSize);
  Tile[][] tiles;

  Board() {
    tiles =  new Tile[boardHeight][boardWidth];
    PVector a = new PVector(0, 0);
    PVector b = new PVector(tileSize/2, tileSize);
    PVector c = new PVector(tileSize, 0);
    boolean flag = false;

    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        tiles[i][j] = new Tile(a, b, c, flag);
        a = b.copy();
        b = c.copy();
        c = a.copy();
        c.x += tileSize;
        flag = !flag;
      }
      if (i%2 == 0) {
        a.set(0, a.y + tileSize);
        c.set(a.x + tileSize, a.y);
        b.set(a.x + tileSize/2, a.y - tileSize);
      } else {
        a.set(0, a.y + tileSize);
        c.set(tileSize, a.y);
        b.set(tileSize/2, b.y + tileSize);
      }
    }
    resetGame();
  }

  public void show() {
    if (!win()) {
      board.showPlay();
    } else {
      board.showEnd();
    }
  }

  public void showPlay() {
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        tiles[i][j].show();
      }
    }
  }

  public void showEnd() {
    fill(0, 0, 255);
    text("Congradulations!", boardSize/3+50, boardSize/2);
  }

  public void action() {
    if (win() && mouseButton == LEFT) {
      numMines += 5;
      resetGame();
    } else {
      for (int i = 0; i < boardHeight; i++) {
        for (int j = 0; j < boardWidth; j++) {
          if (mouseButton == LEFT) {
            if (tiles[i][j].click()) {
              if (tiles[i][j].mine) {
                resetGame();
              } else {
                lookAround(i, j);
              }
            }
          } else if (mouseButton == RIGHT) {
            tiles[i][j].cover();
          }
        }
      }
    }
  }

  public boolean win() {
    boolean flag = true;
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (!tiles[i][j].visited && !tiles[i][j].check && !tiles[i][j].mine) {
          flag = false;
        }
      }
    }
    return flag;
  }

  public void newGame() {
    int count = 0;
    int ran;

    //set the mines for the board
    while (count<numMines) {
      ran = PApplet.parseInt(random(0, boardHeight * boardWidth));
      if (ran < boardWidth*boardWidth && !tiles[ran/boardWidth][ran % boardWidth].space) {
        int i = ran/boardWidth;
        int j = ran % boardWidth;
        tiles[i][j].space = true;
        tiles[i][j].mine = true;
        //println("Mine: " + i + " " + j); 

        if (j-1 >= 0) { //left
          if (i-1 >= 0) { //left top
            tiles[i-1][j-1].counter++;
            if (!tiles[i][j].up && j-2 >= 0) {//far left top
              tiles[i-1][j-2].counter++;
            }
          }
          if (i+1 < boardHeight) { //left bottom
            tiles[i+1][j-1].counter++;
            if (tiles[i][j].up && j-2 >= 0) { //far left bottom
              tiles[i+1][j-2].counter++;
            }
          }
          tiles[i][j-1].counter++; //left middle
          if (j-2 >= 0) {
            tiles[i][j-2].counter++; //far left middle
          }
        }

        if (i-1 >= 0) {
          tiles[i-1][j].counter++;  //top middle
        }
        if (i+1 < boardHeight) {
          tiles[i+1][j].counter++; //bottom middle
        }

        if (j+1 < boardWidth) {
          if (i-1 >= 0) {
            tiles[i-1][j+1].counter++; //top right
            if (!tiles[i][j].up && j+2 < boardWidth) { //far top right
              tiles[i-1][j+2].counter++;
            }
          }
          if (i+1 < boardHeight) {
            tiles[i+1][j+1].counter++; //bottom right
            if (tiles[i][j].up && j+2 < boardWidth) { //far bottom right
              tiles[i+1][j+2].counter++;
            }
          }
          tiles[i][j+1].counter++; // middle right
          if (j+2 < boardWidth) {
            tiles[i][j+2].counter++; //far middle right
          }
        }

        count++;
      }
    }
  }

  public void resetGame() {
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        tiles[i][j].reset();
      }
    }
    newGame();
  }

  //add more to lookaround
  public void lookAround(int i, int j) {
    if (!tiles[i][j].visited) {
      tiles[i][j].visited = true;
      tiles[i][j].check = true;
      if (tiles[i][j].counter == 0) {
        if (j-1 >= 0) { //left
          if (i-1 >= 0) { //left top
            lookAround(i-1, j-1);
            if (!tiles[i][j].up && j-2 >= 0) {//far left top
              lookAround(i-1, j-2);
            }
          }
          if (i+1 < boardHeight) { //left bottom
            lookAround(i+1, j-1);
            if (tiles[i][j].up && j-2 >= 0) { //far left bottom
              lookAround(i+1, j-2);
            }
          }
          lookAround(i, j-1); //left middle
          if (j-2 >= 0) {
            lookAround(i, j-2); //far left middle
          }
        }

        if (i-1 >= 0) {
          lookAround(i-1, j);  //top middle
        }
        if (i+1 < boardHeight) {
          lookAround(i+1, j); //bottom middle
        }

        if (j+1 < boardWidth) {
          if (i-1 >= 0) {
            lookAround(i-1, j+1); //top right
            if (!tiles[i][j].up && j+2 < boardWidth) { //far top right
              lookAround(i-1, j+2);
            }
          }
          if (i+1 < boardHeight) {
            lookAround(i+1, j+1); //bottom right
            if (tiles[i][j].up && j+2 < boardWidth) { //far bottom right
              lookAround(i+1, j+2);
            }
          }
          lookAround(i, j+1); // middle right
          if (j+2 < boardWidth) {
            lookAround(i, j+2); //far middle right
          }
        }
      }
    }
  }
}
class Tile {
  //3 points of the triangle
  PVector p1;     
  PVector p2;
  PVector p3; 

  int counter;      // How many bombs are next to tile 

  boolean red;      // draw square as red
  boolean visited;  // used during the flipping multiple things
  boolean space;    // shows whether a bomb oready there or not
  boolean check;    // shows what's hiding
  boolean mine;     // whether it has a mine or not
  boolean up;       // which direction the triangle is facing

  Tile(PVector a, PVector b, PVector c, boolean dir) {
    p1 = a.copy(); 
    p2 = b.copy();
    p3 = c.copy(); 

    counter = 0; 
    red = false;
    visited = false; 
    space = false;
    check = false; 
    mine = false;
    up = dir;
  }

  public void reset() {
    visited = false; 
    check = false;
    mine = false;
    space = false;
    red = false;
    counter = 0;
  }

  public void show() {
    int tileSize = PApplet.parseInt(p3.x - p1.x); 
    stroke(0); 
    strokeWeight(1);
    if (red) {
      fill(255, 0, 0);
      triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    } else if (check) {
      fill(255); 
      triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
      if (mine) { 
        fill(51);
        ellipse(p2.x - 2, (p1.y + p2.y + p3.y)/3, tileSize/4, tileSize/4);
      } else {
        if (counter == 0) {
          fill(255);
        } else if (counter == 1) {
          fill(0, 0, 255);
        } else if (counter == 2) {
          fill(0, 255, 0);
        } else if (counter == 3) {
          fill(255, 255, 0);
        } else if (counter == 4) {
          fill(255, 75, 0);
        } else if (counter > 4) {
          fill(255, 0, 0);
        }
        text(counter, p2.x - 2, (p1.y + p2.y + p3.y)/3);
      }
    } else {
      fill(175);
      triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    }
  }

  public void cover() {
    if (PointInTriangle(mouse, p1, p2, p3) && !check) {
      red = !red;
    }
  }

  public boolean click() {
    if (!red && !check && PointInTriangle(mouse, p1, p2, p3)) {
      check = true;
      return (mine || counter==0);
    }
    return false;
  }

  private boolean PointInTriangle(PVector p, PVector p1, PVector p2, PVector p3) {
    float alpha = ((p2.y - p3.y)*(p.x - p3.x) + (p3.x - p2.x)*(p.y - p3.y)) / ((p2.y - p3.y)*(p1.x - p3.x) + (p3.x - p2.x)*(p1.y - p3.y));
    float beta = ((p3.y - p1.y)*(p.x - p3.x) + (p1.x - p3.x)*(p.y - p3.y)) / ((p2.y - p3.y)*(p1.x - p3.x) + (p3.x - p2.x)*(p1.y - p3.y));
    float gamma = 1.0f - alpha - beta;

    return (alpha > 0 && beta > 0 && gamma > 0);
  }
}
  public void settings() {  size(640, 640); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "TriangleMineSweeper" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
