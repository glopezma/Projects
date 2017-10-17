function Pipe() {
  this.x = width;
  this.width = 60;
  this.gapLength = 160;
  this.gapTop = int(random(0, height - (this.gapLength)));
  this.gapBottom = this.gapTop + this.gapLength;
}

Pipe.prototype.show = function() {
  fill(0, 255, 0);
  rect(this.x, 0, this.width, this.gapTop);
  rect(this.x, this.gapBottom, this.width, height - this.gapTop - this.gapLength);
}

Pipe.prototype.move = function() {
  this.x -= 1;
}

Pipe.prototype.collision = function(myBird) {
  if (!(myBird.x + myBird.r / 2 < this.x || myBird.x - myBird.r / 2 > this.x + this.width ||
      (myBird.y + myBird.r / 2 < this.gapBottom && myBird.y - myBird.r / 2 > this.gapTop))) {
    flag = false;
  }

}
