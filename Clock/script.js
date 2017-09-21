var width;
var height;

function setup() {
  createCanvas(windowWidth - 25, windowHeight - 25);
  angleMode(DEGREES);

  width = windowWidth - 25;
  height = windowHeight - 25;
}

function draw() {
  background(0);

  translate(width/2, height/2);
  rotate(-90);

  let hr = hour();
  let min = minute();
  let sec = second();

  push();
  fill(255);
  rotate(90);
  noStroke();
  textSize(25);
  if (sec < 10) {
    sec = "0" + sec;
  }
  if (min < 10) {
    min = "0" + min;
  }
  if (hr < 10) {
    hr = "0" + hr;
  }
  text(hr + ":" + min + ":" + sec, -50, 50);
  pop();

  noFill();
  strokeWeight(8);
  stroke(255, 100, 150);
  let secAngle = map(sec, 0, 60, 0, 360);
  arc(0, 0, height * 3 / 4, height * 3 / 4, 0, secAngle);

  push();
  rotate(secAngle);
  line(0, 0, height / 4, 0);
  pop();

  let minAngle = map(min, 0, 60, 0, 360);
  stroke(150, 100, 255);
  arc(0, 0, height * 3 / 4 - 20, height * 3 / 4 - 20, 0, minAngle);

  push();
  rotate(minAngle);
  line(0, 0, height / 4 * 3 / 4, 0);
  pop();

  let hourAngle = map(hr % 12, 0, 12, 0, 360);
  stroke(150, 255, 100);
  arc(0, 0, height * 3 / 4 - 40, height * 3 / 4 - 40, 0, hourAngle);

  push();
  rotate(hourAngle);
  line(0, 0, height / 8, 0);
  pop();

  stroke(255);
  point(0, 0);
}
