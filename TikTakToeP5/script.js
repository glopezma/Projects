var tiles = [];
var offset = 600 / 3;
var turn = true;

function setup() {
  createCanvas(600, 600);
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      tiles.push(new Tile(i * offset, j * offset));
    }
  }
}

function draw() {
  if (!win()) {
    background(51);
    for (var i = 0; i < tiles.length; i++) {
      tiles[i].show();
    }
  } else {
    background(255);
    fill(0);
    textSize(100);
    if (turn) {
      text("O wins", width / 3, height / 3);
    } else {
      text("X wins", width / 3, height / 3);
    }
  }

}

function mousePressed() {
  for (var i = 0; i < tiles.length; i++) {
    if (tiles[i].collision() && !tiles[i].vis && !win()) {
      if (turn) {
        tiles[i].toggle("X");
        turn = false;
      } else {
        tiles[i].toggle("O");
        turn = true;
      }
    }
  }
}

function reset() {
  turn = true;
  for (var i = 0; i < tiles.length; i++) {
    tiles[i].reset();
  }
}

function win() {
  return (
    tiles[0].shape == tiles[1].shape && tiles[1].shape == tiles[2].shape && tiles[0].vis && tiles[1].vis && tiles[2].vis ||
    tiles[3].shape == tiles[4].shape && tiles[4].shape == tiles[5].shape && tiles[3].vis && tiles[4].vis && tiles[5].vis||
    tiles[6].shape == tiles[7].shape && tiles[7].shape == tiles[8].shape && tiles[6].vis && tiles[7].vis && tiles[8].vis||
    tiles[0].shape == tiles[3].shape && tiles[3].shape == tiles[6].shape && tiles[0].vis && tiles[3].vis && tiles[6].vis||
    tiles[1].shape == tiles[4].shape && tiles[4].shape == tiles[7].shape && tiles[1].vis && tiles[4].vis && tiles[7].vis||
    tiles[2].shape == tiles[5].shape && tiles[5].shape == tiles[8].shape && tiles[2].vis && tiles[5].vis && tiles[8].vis||
    tiles[0].shape == tiles[4].shape && tiles[4].shape == tiles[8].shape && tiles[0].vis && tiles[4].vis && tiles[8].vis||
    tiles[2].shape == tiles[4].shape && tiles[4].shape == tiles[6].shape && tiles[2].vis && tiles[4].vis && tiles[6].vis
  );
}
