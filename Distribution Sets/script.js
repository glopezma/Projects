var matrix;
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
  matrix = new Matrix();
}

function draw() {
  background(51);
  matrix.show();
}

function leftDistributions() {
  var dis = true;
  for (var i = 0; i < 16; i++) {
    for (var j = 0; j < 16; j++) {
      for (var a = 0; a < 2; a++) {
        for (var b = 0; b < 2; b++) {
          for (var c = 0; c < 2; c++) {
            //if(a opp (b + c ) != (a opp b) + (a * c)) set to false;
          }
        }
      }
      //set i distributive over j
      dis = true;
    }
    dis = true; //reset the variable.
  }
}
