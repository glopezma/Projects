class Board {
  Tile[][] tiles;
  int xpos; 
  int ypos; 
  int boardSize; 
  int tileSize; 
  int numMines; 
  int numTiles; 

  Board() {
    PVector a; 
    PVector b;
    PVector c; 
    boardSize = width; 
    tileSize = 40; 
    numMines = 10; 
    numTiles = boardSize/tileSize;     

    tiles = new Tile[numTiles][numTiles]; 

    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j<numTiles; j++) {
        if(i%2 == 0){
         if(j%2 == 0) {
           
         } else {
           
         }
        }
        else {
         if(j % 2 == 0) { 
           
         }
         else {
           
         }
        }
        //if odd, do a if even do b
        PVector a = new PVector(i, j); 
        tiles[i][j] = new Tile(a, b, c);
        xpos += tileSize;
      }
      xpos = 0; 
      ypos += tileSize;
    }

    newGame();
  }

  void newGame() {
    int count = 0;
    int ran; 

    //set the mines for the board
    while (count<numMines) {
      ran = int(random(0, numTiles * numTiles));
      if (ran < numTiles*numTiles && !tiles[ran/numTiles][ran % numTiles].space) {
        int i = ran/numTiles;
        int j = ran % numTiles;
        tiles[i][j].space = true;
        tiles[i][j].setMine();

        if (j-1 >= 0) { //left 
          if (i-1 >= 0) { //left top
            tiles[i-1][j-1].counter++;
          }
          if (i+1 < numTiles) { //left bottom
            tiles[i+1][j-1].counter++;
          }
          tiles[i][j-1].counter++; //left middle
        }

        if (i-1 >= 0) {
          tiles[i-1][j].counter++;  //top middle
        }
        if (i+1 < numTiles) {
          tiles[i+1][j].counter++; //bottom middle
        }

        if (j+1 < numTiles) {
          if (i-1 >= 0) {
            tiles[i-1][j+1].counter++; //top right
          }
          if (i+1 < numTiles) {
            tiles[i+1][j+1].counter++; //bottom right
          }
          tiles[i][j+1].counter++; // middle right
        }

        count++;
      }
    }
  }

  void showPlay() {
    for (int i = 0; i<numTiles; i++) {
      for (int j = 0; j<numTiles; j++) {
        tiles[i][j].show(tileSize);
      }
    }
  }

  //show the board with bombs
  void showEnd() {
    fill(0, 0, 255);
    text("Congradulations!", boardSize/3+50, boardSize/2);
  }

  //add more to lookaround
  void lookAround(int i, int j) {
    if (!tiles[i][j].visited) {
      tiles[i][j].visited = true;
      tiles[i][j].check = true;
      if (tiles[i][j].counter == 0) {
        if (j-1 >= 0) { //left 
          if (i-1 >= 0) { //left top
            lookAround(i-1, j-1);
          }
          if (i+1 < numTiles) { //left bottom
            lookAround(i+1, j-1);
          }
          lookAround(i, j-1); //left middle
        }

        if (i-1 >= 0) {
          lookAround(i-1, j);  //top middle
        }
        if (i+1 < numTiles) {
          lookAround(i+1, j); //bottom middle
        }

        if (j+1 < numTiles) {
          if (i-1 >= 0) {
            lookAround(i-1, j+1); //top right
          }
          if (i+1 < numTiles) {
            lookAround(i+1, j+1); //bottom right
          }
          lookAround(i, j+1); // middle right
        }
      }
    }
  }

  void action() {
    if (mouseButton == LEFT) {
      if (win()) {
        numMines += 5; 
        resetGame();
      } else {
        board.click();
      }
    }
    if (mouseButton == RIGHT) {
      cover();
    }
  }
  
    void click() {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        if (mouseX < tiles[i][j].x+tileSize && mouseX > tiles[i][j].x && mouseY < tiles[i][j].y+tileSize && mouseY > tiles[i][j].y && !tiles[i][j].red) {
          if (tiles[i][j].mine) {
            resetGame();
          } else {
            tiles[i][j].check = true;
            lookAround(i, j);
          }
        }
      }
    }
  }
  
  void cover() {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        if (mouseX < tiles[i][j].x+tileSize && mouseX > tiles[i][j].x && mouseY < tiles[i][j].y+tileSize && mouseY > tiles[i][j].y) {
          tiles[i][j].red = (tiles[i][j].red)? false: true;
        }
      }
    }
  }

  void resetGame() {
    print("Way to stink, you stinker!");
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        tiles[i][j].reset();
      }
    }
    newGame();
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
}