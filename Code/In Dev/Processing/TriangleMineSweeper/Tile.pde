class Tile {
  PVector p1;   
  PVector p2;
  PVector p3; 

  int counter; 
  boolean red;      // draw square as red
  boolean visited;  // used during the flipping multiple things
  boolean space;    // shows whether a bomb oready there or not
  boolean check;    // shows what's hiding
  boolean mine;     // whether it has a mine or not

  Tile(PVector a, PVector b, PVector c) {
    p1 = a; 
    p2 = b;
    p3 = c; 
    
    counter = 0; 
    red = false;
    visited = false; 
    space = false;
    check = false; 
    mine = false; 
  }

  void setMine() {
    mine = true;
  }

  void reset() {
    visited = false; 
    check = false;
    mine = false;
    space = false;
    red = false;
    counter = 0;
  }

  void show(int tileSize) {
    if (!check) {
      if (red) {
        fill(255, 0, 0);
      } else {
        fill(200);
      }
    } else {
      fill(255);
    }

    //rectMode(CENTER);
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y); 
    if (check) { 
      if (mine) { 
        fill(51);
        ellipse(p1.x+tileSize/2, p1.y+tileSize/2, tileSize/4, tileSize/4);
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
        text(counter, p1.x+tileSize/2-2, p1.y+tileSize/2+2);
      }
    }
  }
}