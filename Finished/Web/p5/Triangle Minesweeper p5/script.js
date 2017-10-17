document.addEventListener('contextmenu', event => event.preventDefault());
var board;
var mouse;

function setup() {
  createCanvas(640, 640);
  board = new Board();
  board.newGame();
  mouse = new p5.Vector(mouseX, mouseY);
}

function draw() {
  background(51);
  mouse.set(mouseX, mouseY);
  board.show();
}

function mousePressed() {
  board.action();
}

function keyPressed() {
  if (key == " ") {
    board.resetGame();
  }
  else if(keyCode == "UP_ARROW") {
    board.numMines += 5;
    board.resetGame();
  }
  else if(keyCode == "DOWN_ARROW" && baord.numMines-5 > 0) {
    baord.numMines += 5;
    baord.resetGame();
  }
}
