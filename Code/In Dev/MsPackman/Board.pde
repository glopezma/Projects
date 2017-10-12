class Board {
  int tileSize; 
  int numWidth; 
  int numHeight; 
  int boardWidth;
  int boardHeight; 
  Pacman pac; 
  Tile[][] tiles; 

  Board() {
    numWidth = 30; 
    numHeight = 34; 
    tileSize = 20; 

    boardWidth = numWidth * tileSize;
    boardHeight = numHeight * tileSize;
    tiles = new Tile[numHeight][numWidth];
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        tiles[i][j] = new Tile(j, i);
      }
    }

    pac = new Pacman();
  }

  void update() {
    pac.move();
  }

  void show() {
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        if (i == int(pac.loc.y / numHeight) && j == int(pac.loc.x / numWidth)) {
          tiles[i][j].pac = true;
          tiles[i][j].show(pac);
        } else {
          tiles[i][j].pac = false; 
          tiles[i][j].show();
        }
      }
    }
  }
}