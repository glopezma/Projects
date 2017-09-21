var width;
var height;
var dots;

function setup() {
  createCanvas(450, 450);

  dots = new Array(3);

  for (var i = 0; i < 3; i++) {
    dots[i] = new Array(6);
    for (var j = 0; j < 6; j++) {
      dots[i][j] = new Dot(j, i);
    }
  }
}

function draw() {
  background(0);

  let d = new Date();

  let hr = d.getHours();
  let min = d.getMinutes();
  let sec = d.getSeconds();
  let mill = d.getMilliseconds();

  for(var i = 0; i < 3; i++){
    for(var j = 0; j < 6; j++){
      dots[i][j].show(); 
    }
  }
}
