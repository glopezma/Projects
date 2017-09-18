function Matrix() {
  this.x;
  this.y;
  this.tiles = new Array(4);
  for (var i = 0; i < 4; i++) {
    this.tiles[i] = new Array(4);
    for (var j = 0; j < 4; j++) {
      this.tiles[i][j] = new Tile(j, i);
    }
  }
}

Matrix.prototype.show = function() {
  for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
      if (this.tiles[i][j].hover()) {
        //go through and highlight all distributed tiles
      }
      this.tiles[i][j].show();
    }
  }
}
