function setup() {
  createCanvas(800, 800);
  angleMode(DEGREES);
}

function draw() {
  background(0);

  translate(400, 400);
  rotate(-90);

  let hr = hour();
  let min = minute();
  let sec = second();

  noFill();
  strokeWeight(8);
  stroke(255, 100, 150);
  let secAngle = map(sec, 0, 60, 0, 360);
  arc(0, 0, 600, 600, 0, secAngle);

  push();
  rotate(secAngle);
  line(0, 0, 200, 0);
  pop();

  let minAngle = map(min, 0, 60, 0, 360);
  stroke(150, 100, 255);
  arc(0, 0, 280*2, 280*2, 0, minAngle);

  push();
  rotate(minAngle);
  line(0, 0, 75*2, 0);
  pop();

  let hourAngle = map(hr % 12, 0, 12, 0, 360);
  stroke(150, 255, 100);
  arc(0, 0, 260*2, 260*2, 0, hourAngle);

  push();
  rotate(hourAngle);
  line(0, 0, 50*2, 0);
  pop();

  stroke(255);
  point(0, 0);

  push();
  fill(255);
  rotate(90);
  noStroke();
  textSize(25);
  if(sec < 10){
    sec = "0"+sec;
  }
  if(min < 10){
    min = "0"+min;
  }
  if(hr < 10){
      hr = "0"+hr;
  }
  text(hr + ":" + min + ":" + sec, -50, 50);
  pop();
}
