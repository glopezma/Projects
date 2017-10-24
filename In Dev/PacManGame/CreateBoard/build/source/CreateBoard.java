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

public class CreateBoard extends PApplet {

//This is the main file for createBoard

//These are all global so I can access them from anywhere. All my classes use these.
//If I wanted to change the board size, I just need to update this one variable.
int numWidth;     //number of tiles horizontally
int numHeight;    //number of tiles vertically
int tileSize;     //size of each tile
int boardWidth;   //the window width
int boardHeight;  //the window Height
String save = "Save";

JSONArray output;

Board board;

public void setup() {
   //860
  numWidth = 89;
  numHeight = 86;
  tileSize = 10;
  boardWidth = numWidth * tileSize;
  boardHeight = numHeight * tileSize;

  output = new JSONArray();
  board = new Board();
}

//This is the loop that runs the game
public void draw() {
  background(51); //draw the background (a gray color you don't see)
  board.show();   //The game board that I draw over the background.

  fill(0, 250, 154);
  rect(0, 0, width, 40);
  fill(255);
  textSize(50);
  text(save, width / 2 - 50, 38);
}

//This is the even listener for key strokes.
public void keyPressed() {
  board.action();
}

public void mouseClicked() {
  if (mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY <= 50 && mouseButton == LEFT) {
    saveGame();
    save = "Success";
  }
}

//this is just a global function that anything can call
//checks if an x and y variable are within the scope of the board.
public boolean inBounds(int x, int y) {
  return (x >= 0 && x < numWidth && y >= 40 && y < numHeight);
}

public void saveGame() {
  int loc;
  JSONObject tile;

  for (int i = 0; i < numHeight; i++) {
    for (int j = 0; j < numWidth; j++) {
      tile = new JSONObject();
      loc = i*numWidth + j;
      
      tile.setInt("location", loc); 
      tile.setBoolean("bigFood", board.tiles[i][j].bigFood);
      tile.setBoolean("smallFood", board.tiles[i][j].smallFood);
      tile.setBoolean("wall", board.tiles[i][j].wall);
      tile.setBoolean("pac", board.tiles[i][j].pac);

      output.setJSONObject(loc, tile);
    }
  }

  saveJSONArray(output, "../MsPackman/data/boardSetup.json");
}


// The following short JSON file called "data.json" is parsed
// in the code below. It must be in the project's "data" folder.
//
// [
//   {
//     "id": 0,
//     "species": "Capra hircus",
//     "name": "Goat"
//   },
//   {
//     "id": 1,
//     "species": "Panthera pardus",
//     "name": "Leopard"
//   },
//   {
//     "id": 2,
//     "species": "Equus zebra",
//     "name": "Zebra"
//   }
// ]
// JSONArray values;
//
// void setup() {
//
// values = loadJSONArray("data.json");
//
// for (int i = 0; i < values.size(); i++) {
//
//   JSONObject animal = values.getJSONObject(i);
//
//   int id = animal.getInt("id");
//   String species = animal.getString("species");
//   String name = animal.getString("name");
//
//   println(id + ", " + species + ", " + name);
// }
// }

// String[] species = { "Capra hircus", "Panthera pardus", "Equus zebra" };
// String[] names = { "Goat", "Leopard", "Zebra" };
//
// JSONArray values;
//
// void setup() {
//
// values = new JSONArray();
//
// for (int i = 0; i < species.length; i++) {
//
//   JSONObject animal = new JSONObject();
//
//   animal.setInt("id", i);
//   animal.setString("species", species[i]);
//   animal.setString("name", names[i]);
//
//   values.setJSONObject(i, animal);
// }
//
// saveJSONArray(values, "data/new.json");
// }
//This is the board class. It contains the grid of tiles
class Board {
  Tile[][] tiles; //This is a seperate class that actually hold most of the info for that specific tile

  //init the board with the empty tiles
  Board() {
    tiles = new Tile[numHeight][numWidth];
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        //You'll notice I pass the j and i variables * tileSize to put the tiles in the correct spaces
        tiles[i][j] = new Tile(j*tileSize, i*tileSize);
      }
    }
  }

  //called from main.
  //this is the driver for the tiles show. That way I don't have to run the for
  //loop in the main draw function.
  public void show() {
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        tiles[i][j].show(); //draw each tile
      }
    }
  }

  //if someone pushes a key on the keyboard, this is run
  public void action() {
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        if (tiles[i][j].inTile(mouseY, mouseX)) { //check each tile to see if the mouse is hovering over it.
          //The next part is just seeing which key was actually pressed and then setting that tile appropriately
          if (key == 's') {
            tiles[i][j].resetTile();
            tiles[i][j].smallFood = true;
          } else if (key == 'b') {
            tiles[i][j].resetTile();
            tiles[i][j].bigFood = true;
          } else if (key == 'w') {
            tiles[i][j].resetTile();
            tiles[i][j].wall = true;
          } else if (key == 'p') {
            removePac();
            tiles[i][j].resetTile();
            tiles[i][j].pac = true;
          } else if (keyCode == BACKSPACE) {
            tiles[i][j].resetTile();
          }
        }
      }
    }
  }

  public void removePac() {
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        tiles[i][j].pac = false;
      }
    }
  }
}
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
  public boolean border(int x, int y) {
    return (x == 0 || y == 40 || x == (numWidth - 1) * tileSize || y == (numHeight + 3) * tileSize);
  }


  public void show() {
    stroke(255, 255, 255, 25); //this sets the color of border around objects I've drawn.
    strokeWeight(1);    //this is the size of the border
    int mycolor = (wall)? color(68, 71, 76, 100): color(0, 19, 56); //I'm setting what color I want to fill the cell depending if it's a wall or not.
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
  public boolean inTile(float y, float x) {
    return (x > this.x && x < this.x + tileSize && y > this.y && y < this.y + tileSize);
  }

  //reset a tile if they push backspace
  public void resetTile() {
   bigFood = false;
   smallFood = false;
   wall = false;
   pac = false;
  }
}
  public void settings() {  size(890, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "CreateBoard" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
