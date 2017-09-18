var input;
var button;
var answer;

function setup(){
  createCanvas(400, 400);
  input = document.getElementById('pull');

  button = document.getElementById('push');
  button.mousePressed(greet);

  answer = createElement('h2', 'what\'s your name?');
  answer.position(20, 5);

  textAlign(CENTER);
  textSize(50);

  noCanvas();
}

function greet(){
  var name = input.value();
  answer.html(name);
}
