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

public class MsPackman extends PApplet {

int score = 0;
int numWidth = 90;
int numHeight = 86;
int tileSize = 10;
int boardWidth = numWidth * tileSize;
int boardHeight = numHeight * tileSize;
Pacman pac;
Board board;

public void setup() {
  
  board = new Board();
  pac = new Pacman();
  
}

public void draw() {
  background(51);
  board.update();
  board.show();
}

public void keyPressed() {
  if (keyCode == LEFT) {
    // int xpos = pac.loc.x; 
    // if(xpos < 0) {
    //   xpos = 0;
    // }
    // if(xpos >= )
    pac.direction = "left";
    pac.setDir(-1, 0);
  } else if (keyCode == RIGHT) {
    pac.setDir(1, 0);
    pac.direction = "right";
  } else if (keyCode == UP) {
    pac.setDir(0, -1);
    pac.direction = "up";
  } else if (keyCode == DOWN) {
    pac.setDir(0, 1);
    pac.direction = "down";
  }
}

public boolean inBounds(int x, int y) {
  return (x >= 0 && x < numWidth && y >= 0 && y < numHeight);
}
class Agent {
  PVector loc;
  PVector dir;
  int animationTimer;
  float speed;
  String direction;

  Agent(int x, int y) {
    loc = new PVector(x, y);
    dir = new PVector(0, 0);
    animationTimer = millis();
    speed = 1;
    direction = "right"; 
  }

  public void setDir(int x, int y) {
    dir.set(x, y);
  }

  public void move() {
    loc.add(PVector.mult(dir, speed));
  }
}
class Board {
  Tile[][] tiles;

  Board() {
    tiles = new Tile[numHeight][numWidth];
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        tiles[i][j] = new Tile(j*tileSize, i*tileSize);
        if (i % 3 == 2 && j % 3 == 2) {
          tiles[i][j].smallFood = true;
        }
      }
    }
  }

  public void update() {
    int x;
    int y;
    if (pac.direction == "up") {
      x = PApplet.parseInt(pac.loc.x / tileSize);
      y = PApplet.parseInt(pac.loc.y / tileSize) - 2;
      if (inBounds(x, y) && !tiles[y][x].wall) {
        pac.move();
      }
    } else if (pac.direction == "down") {
      x = PApplet.parseInt(pac.loc.x / tileSize);
      y = PApplet.parseInt(pac.loc.y / tileSize) + 2;
      if (inBounds(x, y) && !tiles[y][x].wall) {
        pac.move();
      }
    } else if (pac.direction == "right") {
      x = PApplet.parseInt(pac.loc.x / tileSize) + 2;
      y = PApplet.parseInt(pac.loc.y / tileSize);
      if (inBounds(x, y) && !tiles[y][x].wall) {
        pac.move();
      }
    } else if (pac.direction == "left") {
      x = PApplet.parseInt(pac.loc.x / tileSize) - 2;
      y = PApplet.parseInt(pac.loc.y / tileSize);
      if (inBounds(x, y) && !tiles[y][x].wall) {
        pac.move();
      }
    }
  }

  //called from main
  public void show() {
    int x = 0;
    int y = 0;
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        if (i == PApplet.parseInt(pac.loc.y / tileSize) && j == PApplet.parseInt(pac.loc.x / tileSize)) {
          tiles[i][j].pac = true;
          x = j;
          y = i;
        } else {
          tiles[i][j].pac = false;
          tiles[i][j].show();
        }
      }
    }
    tiles[y][x].show(pac);
  }
}
class Pacman extends Agent {
  int mouthPos;
  int diam;
  boolean mouthClosing;

  PVector[] mouthFrame = {
    new PVector(PI/3, 5*PI/3),
    new PVector(PI/4, 7*PI/4),
    new PVector(0, 2*PI)
  };

  Pacman() {
    super(tileSize * numWidth / 2 - 1, tileSize * numHeight - 3 * tileSize);
    println(tileSize * numWidth / 2 + " " + tileSize * numHeight);
    speed = 3;
    diam = 18;
    mouthClosing = true;
    mouthPos = 0;
  }

  //called from Tile class
  public void show(int x, int y) {
    int deg = 0;
    if (direction == "up") {
      deg = 270;
    } else if (direction == "left") {
      deg = 180;
    } else if (direction == "down") {
      deg = 90;
    }
    pushMatrix();
    translate(x, y);
    rotate(radians(deg));
    fill(230, 20, 147);
    arc(0, 0, diam, diam, mouthFrame[mouthPos].x, mouthFrame[mouthPos].y, PIE);
    popMatrix();
    mouthAnimation();
  }

  public void mouthAnimation() {
    if (millis() > animationTimer + 75) {
      animationTimer = millis();
      mouthPos += (mouthClosing)? 1:-1;
      if (mouthPos <= 0) {
        mouthClosing = true;
      } else if (mouthPos >= 2) {
        mouthClosing = false;
      }
    }
  }
}
class Tile {
  int x;
  int y;
  boolean bigFood;
  boolean smallFood;
  boolean wall;
  boolean pac;

  Tile(int x, int y) {
    this.x = x;
    this.y = y;
    bigFood = false;
    smallFood = false;
    // wall = false;
    wall = (this.x == 0 || this.y == 0 || this.x == (numWidth - 1) * tileSize || this.y == (numHeight - 1) * tileSize)? true:false;
    pac = false;
  }

  //called from board class
  public void show(Pacman pac) {
    show();
    if (smallFood) {
      score += 100;
      smallFood = false;
    }
    pac.show(x + pac.diam/4 + 2, y + pac.diam/4 + 1);
  }

  public void show() {
    stroke(255, 255, 255, 25);
    strokeWeight(1);
    int mycolor = (wall)? color(68, 71, 76, 100): color(0, 19, 56);
    fill(mycolor);
    rect(x, y, tileSize, tileSize);
    if (smallFood && !wall) {
      fill(255, 255, 255);
      ellipse(x + tileSize / 2, y + tileSize / 2, tileSize / 2, tileSize / 2);
    }
  }
}
  public void settings() {  size(900, 860);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "MsPackman" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
