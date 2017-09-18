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
  for (var i = 0; i < 4; i++) {
    tiles[i] = new Array(4);
    for (var j = 0; j < 4; j++) {
      tiles[i][j] = new Tile(j, i);
    }
  }
}

function draw() {
  background(51);
  for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
      if(tiles[i][j].hover()){
        //go through and highlight all distributed tiles
      }
      tiles[i][j].show();
    }
  }
}

function leftDistributions() {
  for (var i = 0; i < 16; i++) {
    for (var j = 0; j < 16; j++) {
      for (var k = 0; k < 2; k++) {
        for (var l = 0; l < 2; l++) {
          for (var m = 0; m < 2; m++) {

          }
        }
      }
      //set i distributive over j 
    }
  }
}
