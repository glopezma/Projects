function Tile(x, y) {
  this.x = x;
  this.y = y;
  this.vis = false;
  this.shape;
}

Tile.prototype.show = function() {
  fill(200);
  strokeWeight(3);
  rect(this.x, this.y, offset, offset);
  if (this.shape == "X" && this.vis) {
    fill(0);
    textSize(100);
    text("X", this.x + offset / 3, this.y + offset / 1.5);
  } else if (this.shape == "O" && this.vis) {
    fill(0);
    textSize(100);
    text("O", this.x + offset / 3, this.y + offset / 1.5);
  }
}

Tile.prototype.collision = function() {
  return (mouseX > this.x && mouseX < this.x + offset && mouseY > this.y && mouseY < this.y + offset)
}

Tile.prototype.toggle = function(option) {
  this.shape = option;
  this.vis = true;
}

Tile.prototype.reset = function(){
  this.vis = false;
  this.shape;
}
