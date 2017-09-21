// Future Endevors:
/*
// 1. Look ahead -- riht now you can kill yourself by turnign too quickly
// This is a bug in the way the character moves. (aka, the head can eat the neck if turn fast enough)
// 2. make rainbow peices.
*/
var fps = 15;
var gridSize = 15;
var numSpaces = 40;
var head;
var tail = [];
var temp;
var food;
var flag = true;

function setup() {
  createCanvas(600, 600);
  frameRate(fps);
  food = new Food();
  head = new Snake();
  head.dirx = 1;
  temp = new Snake();

  for (var i = 0; i < 3; i++) {
    tail.push(new Snake())
    tail[i].x = gridSize * (numSpaces / 2 - (i + 1));
    tail[i].y = gridSize * (numSpaces / 2);
  }

  food.x = gridSize * int((random(0, numSpaces)));
  food.y = gridSize * int((random(0, numSpaces)));
  foodCheck();

}

function draw() {
  background(51);
  food.show();
  head.show();

  temp.x = head.x;
  temp.y = head.y;

  head.move();

  if (foodCollision(head, food)) {
    food.x = gridSize * int((random(0, numSpaces)));
    food.y = gridSize * int((random(0, numSpaces)));
    foodCheck();
    tail.unshift(new Snake());
    tail[0].x = temp.x;
    tail[0].y = temp.y;
  } else if (snakeCollision() || outOfBounds()) {
    head.dirx = 1;
    head.diry = 0;
    head.x = gridSize * numSpaces / 2;
    head.y = gridSize * numSpaces / 2;

    tail = [];
    for (var i = 0; i < 3; i++) {
      tail.push(new Snake())
      tail[i].x = gridSize * (numSpaces / 2 - (i + 1));
      tail[i].y = gridSize * (numSpaces / 2);
    }
    foodCheck();
  } else {
    for (var i = 0; i < tail.length; i++) {
      tail[i].show();
    }
    catchUp();
  }
}


function keyPressed() {
  flag = true;
  if (keyCode == LEFT_ARROW && head.dirx != 1) {
    head.setDir(-1, 0);
  } else if (keyCode == RIGHT_ARROW && head.dirx != -1) {
    head.setDir(1, 0);
  } else if (keyCode == DOWN_ARROW && head.diry != -1) {
    head.setDir(0, 1);
  } else if (keyCode == UP_ARROW && head.diry != 1) {
    head.setDir(0, -1);
  }
}

function catchUp() {
  for (var i = tail.length - 1; i >= 0; i--) {
    if (i == 0) {
      tail[i].x = temp.x;
      tail[i].y = temp.y;
    } else {
      tail[i].x = tail[i - 1].x;
      tail[i].y = tail[i - 1].y;
    }
  }
}

function foodCollision(mySnake, myFood) {
  return (mySnake.x == myFood.x && mySnake.y == myFood.y);
}

function foodCheck() {
  if (foodCollision(head, food)) {
    food.x = int((random(0, numSpaces)));
    food.y = int(round(random(0, numSpaces)));
  }
  for (var i = 0; i < tail.length; i++) {
    if (foodCollision(tail[i], food)) {
      food.x = int((random(0, numSpaces)));
      food.y = int((random(0, numSpaces)));
    }
  }
}

function snakeCollision() {
  for (var i = 0; i < tail.length; i++) {
    if (foodCollision(head, tail[i])) {
      return true;
    }
  }
  return false;
}

function outOfBounds(){
  return !(head.x < width && head.x >= 0 && head.y >= 0 && head.y < height);
}
