//This is the tile class
class Tile {
  int x;    //Every tile knows it's x and y location.
  int y;
  boolean bigFood;   // b + mouse creates the big food that allows you to eat ghosts
  boolean smallFood; // s + mouse creates small food that you need to win
  boolean wall;      // w + mouse creaetes a wall
  boolean pac;       // p + mouse displays pacman's location.
  //reset backspace mouse

  //first everything is set off, so no food or walls (other than the border which can be removed with backspace)
  Tile(int x, int y) {
    this.x = x;
    this.y = y + 40;
    bigFood = false;
    smallFood = false;
    wall = (border(this.x, this.y))? true:false;
    pac = false;
  }

  //This is to help create the barrior around the board in the beginning of the game
  boolean border(int x, int y) {
    return (x == 0 || y == 40 || x == (numWidth - 1) * tileSize || y == (numHeight + 3) * tileSize);
  }


  void show() {
    stroke(255, 255, 255, 25); //this sets the color of border around objects I've drawn.
    strokeWeight(1);    //this is the size of the border
    color mycolor = (wall)? color(68, 71, 76, 100): color(0, 19, 56); //I'm setting what color I want to fill the cell depending if it's a wall or not.
    fill(mycolor);  //Fill the rectangle with that color
    rect(x, y, tileSize, tileSize); //draw the rectangle
    //if it's not a wall then I need check to see if food is there, then make a cirlce for the food
    if (!wall) {
      fill(255); //the food is white
      if (smallFood) { //elipse(xpos, ypos, diameterx, diamtery);
        ellipse(x + tileSize / 2, y + tileSize / 2, tileSize / 2, tileSize / 2);
      } else if (bigFood) {
        ellipse(x + tileSize / 2, y + tileSize / 2, tileSize, tileSize);
      }
    } //if pacman is in that tile, draw him <-- this makes sense in the real game. It's kind of just here because I didn't delete it.
    if (pac) {
      fill(230, 20, 147);
      rect(x, y, tileSize, tileSize);
    }
  }

  //Checks if some coordinates are in a tile (called with y and x being my mouseX and mouseY)
  boolean inTile(float y, float x) {
    return (x > this.x && x < this.x + tileSize && y > this.y && y < this.y + tileSize);
  }

  //reset a tile if they push backspace
  void resetTile() {
   bigFood = false;
   smallFood = false;
   wall = false;
   pac = false;
  }
}
