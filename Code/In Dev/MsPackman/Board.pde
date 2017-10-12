class Board {
  Tile[][] tiles; 

  Board() {
    tiles = new Tile[numHeight][numWidth];
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        tiles[i][j] = new Tile(j*tileSize, i*tileSize);
      }
    }
  }

  void update() {
    pac.move();
  }

  void show() {
    int x = 0; 
    int y = 0; 
    for (int i = 0; i < numHeight; i++) {
      for (int j = 0; j < numWidth; j++) {
        if (i == int(pac.loc.y / tileSize) && j == int(pac.loc.x / tileSize)) {
          tiles[i][j].pac = true;
          x = j; 
          y = i;
        } else {
          tiles[i][j].pac = false; 
          tiles[i][j].show();
        }
      }
    }
    if(pac.loc.x < 0 || pac.loc.y < 0){
      
    }
    tiles[y][x].show(pac);
  }
}