function Vehicle(x, y) {
  this.pos = createVector(x, y, 0);
  this.vel = p5.Vector.random2D();
  this.acc = createVector();

  this.r = 6;
  this.maxSpeed = 4;
  this.maxForce = 0.3;
  this.vel.setMag(this.maxSpeed);
}

Vehicle.prototype.applyForce = function(force){
  this.acc.add(force);
}

Vehicle.prototype.update = function() {
  this.vel.add(this.acc);
  this.vel.limit(this.maxSpeed);
  this.pos.add(this.vel);
  this.acc.mult(0);
}

Vehicle.prototype.seek = function(target) {
  this.maxSpeed = map(p5.Vector.dist(target, this.pos), 0, 750, 0.0, 10.0);
  this.maxForce = map(p5.Vector.dist(target, this.pos), 0, 750, 0.0, 1);
  var desired = p5.Vector.sub(target, this.pos); // A vector pointing from the position to the target
  desired.setMag(this.maxSpeed);
  var steer = p5.Vector.sub(desired, this.vel);
  steer.limit(this.maxForce); // Limit to maximum steering force

  this.applyForce(steer);
}

Vehicle.prototype.display = function() {
  var theta = this.vel.heading() + PI / 2;
  fill(127);
  stroke(0);
  strokeWeight(1);
  translate(this.pos.x, this.pos.y);
  rotate(theta);
  beginShape();
  vertex(0, -this.r * 2);
  vertex(-this.r, this.r * 2);
  vertex(this.r, this.r * 2);
  endShape(CLOSE);
  pop();
}
