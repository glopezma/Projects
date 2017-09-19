var matrix;
var myWidth;
var myHeight;
var tileHeight;
var tileWidth;
var flag = true;

function preload() {
  myWidth = windowWidth - 25;
  myHeight = windowHeight - 100;
  tileHeight = myHeight / 4;
  tileWidth = myWidth / 4;
  matrix = new Matrix();
}

function setup() {
  createCanvas(myWidth, myHeight);
  leftDistributionsIn();
}

function draw() {
  background(51);
  matrix.highlight();
  matrix.show();
}

function mouseClicked(){
  flag = flag? false:true;
  for(var i = 0; i < 4; i++){
    for(var j = 0; j < 4; j++){
      for(var k = 0; k < 16; k++){
        matrix.tiles[i][j].fillTable[k] = false;
        matrix.tiles[i][j].count = 0;
      }
    }
  }
  if(flag){
    leftDistributionsIn();
    document.getElementById("header").innerHTML = "Inset";
  }
  else{
    leftDistributionsOut();
    document.getElementById("header").innerHTML = "Outset";
  }
}

function leftDistributionsIn() {
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
      matrix.tiles[int(i/4)][i%4].count += (matrix.tiles[int(i/4)][i%4].fillTable[j])? 1:0;
      dis = true;
    }
  }
}

function leftDistributionsOut() {
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
      matrix.tiles[int(j/4)][j%4].fillTable[i] = dis;
      matrix.tiles[int(j/4)][j%4].count += (matrix.tiles[int(j/4)][j%4].fillTable[i])? 1:0;
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
