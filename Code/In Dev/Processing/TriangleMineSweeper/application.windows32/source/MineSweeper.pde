// Gabriel Lopez
// Mine Sweeper made from processing
// Sep 1, 2017

// Every time you win the game, it'll send a congradulations and
// make it a little harder for the next game. 

Tile[][] tiles;
int xpos = 0; 
int ypos = 0; 
int boardSize = 600; 
int tileSize = 20; 
int numMines = 100; 
int numTiles = boardSize/tileSize; 

void setup() {
  size(600, 600);  
  tiles = new Tile[boardSize/tileSize][boardSize/tileSize]; 
  for (int i = 0; i < boardSize/tileSize; i++) {
    for (int j = 0; j<boardSize/tileSize; j++) {
      tiles[i][j] = new Tile(xpos, ypos/*, i, j*/);
      xpos += tileSize;
    }
    xpos = 0; 
    ypos += tileSize;
  }
  newGame();
}


void draw() {
  background(255);
  if (!win()) {
    for (int i = 0; i<numTiles; i++) {
      for (int j = 0; j<numTiles; j++) {
        tiles[i][j].show();
      }
    }
  } else {
    fill(0, 0, 255);
    text("Congradulations!", boardSize/3+50, boardSize/2);
  }
}


void mousePressed() {
  if (mouseButton == LEFT) {
    if (win()) {
      numMines += 5; 
      resetGame();
    } else {
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
  }
  if (mouseButton == RIGHT) {
    for (int i = 0; i < numTiles; i++) {
      for (int j = 0; j < numTiles; j++) {
        if (mouseX < tiles[i][j].x+tileSize && mouseX > tiles[i][j].x && mouseY < tiles[i][j].y+tileSize && mouseY > tiles[i][j].y) {
          tiles[i][j].red = (tiles[i][j].red)? false: true;
        }
      }
    }
  }
}

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