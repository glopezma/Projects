function Snake() {
  this.x = gridSize * numSpaces / 2;
  this.y = gridSize * numSpaces / 2;
  this.dirx = 0;
  this.diry = 0;
}

Snake.prototype.show = function() {
  fill(255);
  rect(this.x, this.y, gridSize, gridSize);
}

Snake.prototype.setDir = function(x, y) {
  this.dirx = x;
  this.diry = y;
}

Snake.prototype.move = function() {
  this.x += this.dirx * gridSize;
  this.y += this.diry * gridSize;
}
