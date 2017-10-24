var v;
var width;
var height;

function setup(){
  createCanvas(windowWidth-50, windowHeight-25);
  v = new Vehicle((windowWidth-50)/2, (windowHeight-25)/2);
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
