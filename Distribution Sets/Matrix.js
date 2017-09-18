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
      this.tiles[i][j].show();
    }
  }
}

Matrix.prototype.highlight = function() {
  for(var i = 0; i < 4; i++){
    for(var j = 0; j < 4; j++){
      if(this.tiles[i][j].hover()){
        for(var k = 0; k < this.tiles[i][j].fillTable.length; k++){
          this.tiles[int(k/4)][k%4].fill = (this.tiles[i][j].fillTable[k])? true:false;
        }
      }
    }
  }
}
