function Tile(x, y) {
  this.x = x * tileWidth;
  this.y = y * tileHeight;
  this.highlight = false;
  this.value = y * 4 + x;
  this.leftDistributed = []; 
}

Tile.prototype.show = function() {
  noStroke();
  fill(200);
  if (this.highlight) {
    stroke(255, 0, 0);
    strokeWeight(2.5);
  }
  rect(this.x, this.y, tileWidth, tileHeight);
  stroke(0);
  strokeWeight(2.5);
  text(this.value, this.x + tileWidth / 2, this.y + tileHeight / 2);
}

Tile.prototype.hover = function() {
  this.highlight = (mouseX > this.x && mouseX < this.x + tileWidth && mouseY > this.y && mouseY < this.y + tileHeight) ? true : false;
  return highlight;
}
