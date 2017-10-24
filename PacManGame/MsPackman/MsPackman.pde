//import controlP5.*;
//import java.util.*;
//import java.io.File;
int score;
int numWidth;
int numHeight;
int tileSize;
int boardWidth;
int boardHeight;

Pacman pac;
Board board;

void setup() {
  size(890, 860);
  score = 0;
  numWidth = 89;
  numHeight = 86;
  tileSize = 10;
  boardWidth = numWidth * tileSize;
  boardHeight = numHeight * tileSize;

  board = new Board();
  pac = new Pacman();
}

void draw() {
  background(51);
  board.update();
  board.show();
}

void keyPressed() {
  if (keyCode == LEFT) {
    pac.direction = "left";
    pac.setDir(-1, 0);
  } else if (keyCode == RIGHT) {
    pac.setDir(1, 0);
    pac.direction = "right";
  } else if (keyCode == UP) {
    pac.setDir(0, -1);
    pac.direction = "up";
  } else if (keyCode == DOWN) {
    pac.setDir(0, 1);
    pac.direction = "down";
  }
}

//folder = new java.io.File(dataPath(""));
//  fileNames = folder.list();

  //printArray(fileNames);

  // writer = createWriter("board.txt");
  // reader = createReader("board.txt");

  //cp5 = new ControlP5(this);
  //cp5.setAutoDraw(false);
  //cp5.addScrollableList("dropdown")
  //   .setPosition(100, 100)
  //   .setSize(200, 100)
  //   .setBarHeight(20)
  //   .setItemHeight(20)
  //   .addItems(fileNames);


  // void draw() {
  //   background(51);
  //   // if (menu) {
  //   //   menu();
  //   // } else {
  //     board.update();
  //     board.show();
  //   // }
  // }
