var v;
var width;
var height;

function setup(){
  createCanvas(640, 360);
  v = new Vehicle(640/2, 360/2);
  console.log(v); 
}

function draw(){
  background(51);
  var mouse = createVector(mouseX, mouseY);

  fill(200);
  stroke(0);
  strokeWeight(2);

  v.seek(mouse);
  v.update();
  v.display();
}
