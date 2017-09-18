function Bird() {
  this.x = width / 2;
  this.y = height / 2;
  this.r = 30;
  this.lift = -20;
  this.grav = .7;
  this.acc = .92;
  this.vel = 0;
}

Bird.prototype.show = function() {
  fill(255);
  ellipseMode(CENTER);
  ellipse(this.x, this.y, this.r, this.r);
};

Bird.prototype.up = function() {
  this.vel += this.lift;
}

Bird.prototype.move = function() {
  this.vel += this.grav;
  this.vel *= this.acc;
  this.y += this.vel;

  if (this.y + this.r / 2 >= height) {
    // this.y = height-this.r/2;
    // this.vel = 0;
    flag = false;
  } else if (this.y - this.r / 2 <= 0) {
    this.y = 0 + this.r / 2;
    this.vel = 0;
  }
}

Bird.prototype.reset = function() {
  this.x = width / 2;
  this.y = height / 2;
  this.vel = 0;
}
