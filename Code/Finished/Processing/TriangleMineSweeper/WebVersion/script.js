var board;
var mouse;

function setup() {
  createCanvas(640, 640);
  board = new Board();
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
