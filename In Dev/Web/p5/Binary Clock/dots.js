function Dot(x, y) {
  this.x = x * 50 + 450 / 4;
  this.y = y * 50 + 450 / 4;
  this.on = false;
}

Dot.prototype.show = function() {
  fill(255);
  ellipse(this.x, this.y, 25, 25);
}

Dot.prototype.on = function() {
  this.on = this.on ? false : true;
}
