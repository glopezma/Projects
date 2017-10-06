class Board {
  int boardSize = 560; 
  int numMines = 150; 
  int tileSize = 40; 
  int numTiles = 2 * (boardSize/tileSize) - 1;
  boolean win = false;
  Tile[][] tiles;

  Board() {
    tiles =  new Tile[numTiles][numTiles];
    PVector a = new PVector(0, 0);
    PVector b = new PVector(tileSize/2, tileSize);
    PVector c = new PVector(tileSize, 0); 
    boolean flag = true;

    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        tiles[i][j] = new Tile(a, b, c, flag);
        a = b.copy(); 
        b = c.copy(); 
        c = a.copy(); 
        c.x += tileSize;
        flag = !flag;
      }
      if (i%2 == 1) {
        a.set(0, a.y + tileSize);
        c.set(a.x + tileSize, a.y); 
        b.set(a.x + tileSize/2, a.y - tileSize);
      } else {
        a.set(0, a.y + tileSize); 
        c.set(tileSize, a.y); 
        b.set(tileSize/2, b.y + tileSize);
      }
    }
  }

  void show() {
    if (!win()) {
      board.showPlay();
    } else {
      board.showEnd();
    }
  }

  void showPlay() {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        tiles[i][j].show();
      }
    }
  }

  void showEnd() {
    fill(0, 0, 255);
    text("Congradulations!", boardSize/3+50, boardSize/2);
  }

  void action() {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        if (mouseButton == LEFT) {
          if (win()) {
            numMines += 5; 
            //resetGame();
          } else {
            tiles[i][j].click();
          }
        } else if (mouseButton == RIGHT) {
          tiles[i][j].cover();
        }
      }
    }
  }

  boolean win() {
    boolean flag = true;
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j<numTiles; j++) {
        if (!tiles[i][j].visited && !tiles[i][j].check && !tiles[i][j].mine) {
          flag = false;
        }
      }
    }
    return flag;
  }

  //void newGame() {
  //  int count = 0;
  //  int ran; 

  //  //set the mines for the board
  //  while (count<numMines) {
  //    ran = int(random(0, numTiles * numTiles));
  //    if (ran < numTiles*numTiles && !tiles[ran/numTiles][ran % numTiles].space) {
  //      int i = ran/numTiles;
  //      int j = ran % numTiles;
  //      tiles[i][j].space = true;
  //      tiles[i][j].mine = true;

  //      if (j-1 >= 0) { //left 
  //        if (i-1 >= 0) { //left top
  //          tiles[i-1][j-1].counter++;
  //        }
  //        if (i+1 < numTiles) { //left bottom
  //          tiles[i+1][j-1].counter++;
  //        }
  //        tiles[i][j-1].counter++; //left middle
  //      }

  //      if (i-1 >= 0) {
  //        tiles[i-1][j].counter++;  //top middle
  //      }
  //      if (i+1 < numTiles) {
  //        tiles[i+1][j].counter++; //bottom middle
  //      }

  //      if (j+1 < numTiles) {
  //        if (i-1 >= 0) {
  //          tiles[i-1][j+1].counter++; //top right
  //        }
  //        if (i+1 < numTiles) {
  //          tiles[i+1][j+1].counter++; //bottom right
  //        }
  //        tiles[i][j+1].counter++; // middle right
  //      }

  //      count++;
  //    }
  //  }
  //}

  //void resetGame() {
  //  print("Way to stink, you stinker!");
  //  for (int i = 0; i < numTiles; i++) {
  //    for (int j = 0; j < numTiles; j++) {
  //      tiles[i][j].reset();
  //    }
  //  }
  //  newGame();
  //}

  //  //add more to lookaround
  //  void lookAround(int i, int j) {
  //    if (!tiles[i][j].visited) {
  //      tiles[i][j].visited = true;
  //      tiles[i][j].check = true;
  //      if (tiles[i][j].counter == 0) {
  //        if (j-1 >= 0) { //left 
  //          if (i-1 >= 0) { //left top
  //            lookAround(i-1, j-1);
  //          }
  //          if (i+1 < numTiles) { //left bottom
  //            lookAround(i+1, j-1);
  //          }
  //          lookAround(i, j-1); //left middle
  //        }

  //        if (i-1 >= 0) {
  //          lookAround(i-1, j);  //top middle
  //        }
  //        if (i+1 < numTiles) {
  //          lookAround(i+1, j); //bottom middle
  //        }

  //        if (j+1 < numTiles) {
  //          if (i-1 >= 0) {
  //            lookAround(i-1, j+1); //top right
  //          }
  //          if (i+1 < numTiles) {
  //            lookAround(i+1, j+1); //bottom right
  //          }
  //          lookAround(i, j+1); // middle right
  //        }
  //      }
  //    }
  //  }
}