var tiles = new Array(4);
var myWidth;
var myHeight;
var tileHeight;
var tileWidth;

function preload() {
  myWidth = windowWidth - 25;
  myHeight = windowHeight - 25;
  tileHeight = myHeight / 4;
  tileWidth = myWidth / 4;
}

function setup() {
  createCanvas(myWidth, myHeight);
  createMatrix();
  for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
      tiles[i][j] = new Tile(i, j);
    }
  }
}

function draw() {
  background(51);
  for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
      tiles[i][j].hover();
      tiles[i][j].show();
    }
  }
}

function leftDistributions() {
  for (var i = 0; i < 2; i++) {
    for (var j = 0; j < 2; j++) {
      for (var k = 0; k < 2; k++) {
        //something
      }
    }
  }
}

function createMatrix() {
  for (var i = 0; i < tiles.length; i++) {
    tiles[i] = new Array(4);
  }
}
