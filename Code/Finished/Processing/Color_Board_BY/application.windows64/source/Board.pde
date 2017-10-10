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

  void show() {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        tiles[i][j].show();
      }
    }
  }

  void click() {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        tiles[i][j].click();
      }
    }
  }
}