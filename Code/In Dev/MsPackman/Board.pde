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

  void update() {
    int x;
    int y;
    if (pac.direction == "up") {
      x = int(pac.loc.x / tileSize);
      y = int(pac.loc.y / tileSize) - 2;
      if (inBounds(x, y) && !tiles[y][x].wall) {
        pac.move();
      }
    } else if (pac.direction == "down") {
      x = int(pac.loc.x / tileSize);
      y = int(pac.loc.y / tileSize) + 2;
      if (inBounds(x, y) && !tiles[y][x].wall) {
        pac.move();
      }
    } else if (pac.direction == "right") {
      x = int(pac.loc.x / tileSize) + 2;
      y = int(pac.loc.y / tileSize);
      if (inBounds(x, y) && !tiles[y][x].wall) {
        pac.move();
      }
    } else if (pac.direction == "left") {
      x = int(pac.loc.x / tileSize) - 2;
      y = int(pac.loc.y / tileSize);
      if (inBounds(x, y) && !tiles[y][x].wall) {
        pac.move();
      }
    }
  }

  //called from main
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
    tiles[y][x].show(pac);
  }
}
