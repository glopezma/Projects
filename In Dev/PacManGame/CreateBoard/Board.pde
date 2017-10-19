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
  void show() {
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        tiles[i][j].show(); //draw each tile
      }
    }
  }

  //if someone pushes a key on the keyboard, this is run
  void action() {
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

  void removePac() {
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        tiles[i][j].pac = false;
      }
    }
  }
}
