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

Pacman pac; 

public void setup() {
  
   
  pac = new Pacman();
}

public void draw() {
 background(51);  
 pac.move();
 pac.show(); 
}

public void keyPressed() {
  if(keyCode == LEFT) {
    pac.setDir(-1, 0); 
  }
  else if(keyCode == RIGHT) {
    pac.setDir(1, 0); 
  }
  else if(keyCode == UP) {
    pac.setDir(0, -1); 
  }
  else if(keyCode == DOWN) {
    pac.setDir(0, 1);
  }
}
class Agent {
  PVector loc;
  PVector dir;

  float speed;

  Agent() {
    loc = new PVector(width/2, height/2);
    dir = new PVector(0, 0);
  }

  public void setDir(int x, int y) {
    dir.set(x, y);
  }

  public void move() {
    loc.add(PVector.mult(dir, 1.5f));
  }
}
class Board {
  int tileSize; 
  int numWidth; 
  int numHeight; 
  int boardWidth = 30 * 20;
  int boardHeight = 34 * 20; 
  Tile[][] tiles; 
  
  Board(){
    tileSize = 20; 
    numWidth = 30; 
    numHeight = 34; 
    tileSize = 20; 
    boardWidth = numWidth * tileSize;
    boardHeight = numHeight * tileSize; 
    
   tiles = new Tile[numHeight][numWidth]; 
  }  
  
  
}

class Pacman extends Agent{
  boolean open;
  float mouth; 
  Pacman() {
   super();  
   open = false;
   mouth = radians(0); 
  }
  
  
  
  public void show() {
   fill(230, 20, 147);  
   arc(loc.x, loc.y, 25, 25, 0, 2*PI, PIE);
  }
}
class Tile {
 boolean bigFood; 
 boolean smallFood; 
 boolean wall; 
}
  public void settings() {  size(640, 640);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "MsPackman" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
