var bird;
var pipe = [];
var flag = true;
var points = 0;

function setup() {
  createCanvas(600, 600);
  bird = new Bird();
  pipe.push(new Pipe());
}

function draw() {
  background(51);
  if (flag) {
    bird.show();
    bird.move();
    if (pipe.length == 0) {
      pipe.push(new Pipe());
    }
    for (var i = 0; i < pipe.length; i++) {
      pipe[i].show();
      pipe[i].move();
      if (pipe[i].x == width / 2) {
        if (pipe.length > 3 && i < 4) {
          pipe.shift();
        }
        pipe.push(new Pipe());
        points++;
      }
      pipe[i].collision(bird);
      strokeWeight(2);
      textSize(20);
      fill(255);
      text(points, 300, 50);
    }
  } else {
    bird.reset();
    points = 0;
    pipe = [];
    fill(255, 0, 0);
    text("Game Over!\n Press Space to Continue", 200, 300);
  }
}

function keyPressed() {
  if (key == ' ') {
    bird.up();
    flag = true;
  }
}
