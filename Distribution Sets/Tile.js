function Tile(x, y) {
  this.x = x * tileWidth;
  this.y = y * tileHeight;

  this.count = 0;

  this.highlight = false;
  this.fill = false;

  this.value = y * 4 + x;

  this.fillTable = [16];
  for (var i = 0; i < 16; i++) {
    this.fillTable[i] = false;
  }
}

Tile.prototype.show = function() {
  noStroke();
  fill(200);
  if(this.fill){
    if(flag){
      fill(255, 255, 0);
    }
    else{
      fill(135, 206, 250);
    }
  }
  if (this.highlight) {
    stroke(255, 0, 0);
    strokeWeight(2.5);
  }
  rect(this.x, this.y, tileWidth, tileHeight);
  stroke(0);
  strokeWeight(2.5);
  textSize(24);
  text(this.value, this.x + tileWidth / 2, this.y + tileHeight / 2);
}

Tile.prototype.hover = function() {
  this.highlight = (mouseX > this.x && mouseX < this.x + tileWidth && mouseY > this.y && mouseY < this.y + tileHeight) ? true : false;
  return this.highlight;
}
