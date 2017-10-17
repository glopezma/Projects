class Tile {
  int x = 0;   
  int y = 0; 
  //int xcord = 0; 
  //int ycord = 0; 
  int counter = 0; 
  boolean red = false;      // draw square as red
  boolean visited = false;  // used during the flipping multiple things
  boolean space = false;    // shows whether a bomb oready there or not
  boolean check = false;    // shows what's hiding
  boolean mine = false;     // whether it has a mine or not

  Tile(int xpos, int ypos/*, int ycord, int xcord*/) {
    x = xpos; 
    y = ypos;
    //this.ycord = ycord; 
    //this.xcord = xcord;
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

  void show() {
    if (!check) {
      if (red) {
        fill(255, 0, 0);
      } else {
        fill(200);
      }
    }
    else{
     fill(255);  
    }

    //rectMode(CENTER);
    rect(x, y, tileSize, tileSize); 
    if (check) { 
      if (mine) { 
        fill(51);
        ellipse(x+tileSize/2, y+tileSize/2, tileSize/2, tileSize/2);
      } else {
        if(counter == 0){
                  fill(255); 
        }
        else if(counter == 1){
          fill(0, 0, 255);
        }
        else if(counter == 2){
          fill(0, 255, 0); 
        }
        else if(counter == 3){
          fill(255, 255, 0); 
        }
        else if(counter == 4){
          fill(255, 75, 0); 
        }
        else if(counter > 4){
          fill(255, 0, 0);
        }
        text(counter, x+tileSize/2-2, y+tileSize/2+2);
      }
    }
  }
}