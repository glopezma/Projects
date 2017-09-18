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
  matrix = new Matrix();
}

function setup() {
  createCanvas(myWidth, myHeight);
  leftDistributions();
}

function draw() {
  background(51);
  matrix.highlight();
  matrix.show();
}

function leftDistributions() {
  var dis = true;
  for (var i = 0; i < 16; i++) {
    for (var j = 0; j < 16; j++) {
      for (var a = 0; a < 2; a++) {
        for (var b = 0; b < 2; b++) {
          for (var c = 0; c < 2; c++) {
            if (eval(a, i, eval(b, j, c)) != eval(eval(a, i, b), j, eval(a, i, c))) {
              dis = false;
            }
          }
        }
      }
      matrix.tiles[int(i/4)][i%4].fillTable[j] = dis;
      dis = true;
    }
  }
}

function eval(val1, opp, val2) {
  var val1BinaryString = parseInt(val1).toString(2);
  var val2BinaryString = parseInt(val2).toString(2);
  var lookup = parseInt(val1BinaryString + val2BinaryString, 2);
  var oppBinary = parseInt(opp, 10).toString(2);
  while(oppBinary.length < 4){
    oppBinary = "0"+oppBinary; 
  }
  return int(oppBinary.charAt(oppBinary.length - 1 - lookup));
}
