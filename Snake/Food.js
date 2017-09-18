function Food() {
  this.x;
  this.y;
}

Food.prototype.show = function() {
  fill(255);
  rect(this.x+4, this.y+4, gridSize / 2, gridSize / 2);
}
