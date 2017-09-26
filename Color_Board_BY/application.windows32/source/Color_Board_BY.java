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

public class Color_Board_BY extends PApplet {

Board board;      
int boardSize = 450;
int tileSize = 50; 
int numTiles = 450 / 50; 
int[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)}; 
int removeColor; 

public void setup() {
  
  board = new Board();
  println(numTiles); 
  removeColor = colors[PApplet.parseInt(random(0, 3))];
}

public void draw() {
  background(removeColor);
  board.show();
  if (noColor(removeColor)) {
    int temp = removeColor; 
    while (temp == removeColor) {
      removeColor = colors[PApplet.parseInt(random(0, 3))];
    }
  }
  fill(255); 
  textSize(35); 
  text("Remove This Color", 10, 50);
}

public boolean noColor(int myColor) {
  for (int i = 0; i < numTiles; i++) {
    for (int j = 0; j < numTiles; j++) {
      if (board.tiles[i][j].cColor == myColor) {
        return false;
      }
    }
  }
  return true;
}

public void mousePressed() {
  board.click();
}

class Board {
  int boardHeight = 100;  
  Tile[][] tiles; 

  Board() {
    tiles = new Tile[numTiles][numTiles];
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        tiles[i][j] = new Tile(j, i);
      }
    }
  }

  public void show() {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        tiles[i][j].show();
      }
    }
  }

  public void click() {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        tiles[i][j].click();
      }
    }
  }
}

class Tile {
  int x; 
  int y; 
  int cColor; 
  Tile(int x, int y) {
    this.x = x * tileSize; 
    this.y = y * tileSize + 100; 
    cColor = colors[PApplet.parseInt(random(0, 3))];
  }

  public void show() {
    fill(200); 
    stroke(0); 
    strokeWeight(1); 
    rect(x, y, tileSize, tileSize); 
    fill(cColor); 
    noStroke(); 
    ellipse(x + tileSize / 2, y + tileSize / 2, tileSize - 10, tileSize - 10);
  }

  public void click() {
    if (dist(x + tileSize / 2, y + tileSize / 2, mouseX, mouseY) <= (tileSize - 10) / 2) {
      int temp = cColor; 
      while (temp == cColor) {
        cColor = colors[PApplet.parseInt(random(0, 3))];
      }
    }
  }
}

  public void settings() {  size(450, 550); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Color_Board_BY" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
