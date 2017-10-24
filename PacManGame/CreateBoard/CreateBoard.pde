//This is the main file for createBoard

//These are all global so I can access them from anywhere. All my classes use these.
//If I wanted to change the board size, I just need to update this one variable.
int numWidth;     //number of tiles horizontally
int numHeight;    //number of tiles vertically
int tileSize;     //size of each tile
int boardWidth;   //the window width
int boardHeight;  //the window Height
String save = "Save";

JSONArray output;

Board board;

void setup() {
  size(890, 900); //860
  numWidth = 89;
  numHeight = 86;
  tileSize = 10;
  boardWidth = numWidth * tileSize;
  boardHeight = numHeight * tileSize;

  output = new JSONArray();
  board = new Board();
}

//This is the loop that runs the game
void draw() {
  background(51); //draw the background (a gray color you don't see)
  board.show();   //The game board that I draw over the background.

  fill(0, 250, 154);
  rect(0, 0, width, 40);
  fill(255);
  textSize(50);
  text(save, width / 2 - 50, 38);
}

//This is the even listener for key strokes.
void keyPressed() {
  board.action();
}

void mouseClicked() {
  if (mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY <= 50 && mouseButton == LEFT) {
    saveGame();
    save = "Success";
  }
}

//this is just a global function that anything can call
//checks if an x and y variable are within the scope of the board.
boolean inBounds(int x, int y) {
  return (x >= 0 && x < numWidth && y >= 40 && y < numHeight);
}

void saveGame() {
  int loc;
  JSONObject tile;

  for (int i = 0; i < numHeight; i++) {
    for (int j = 0; j < numWidth; j++) {
      tile = new JSONObject();
      loc = i*numWidth + j;
      
      tile.setInt("location", loc); 
      tile.setBoolean("bigFood", board.tiles[i][j].bigFood);
      tile.setBoolean("smallFood", board.tiles[i][j].smallFood);
      tile.setBoolean("wall", board.tiles[i][j].wall);
      tile.setBoolean("pac", board.tiles[i][j].pac);

      output.setJSONObject(loc, tile);
    }
  }

  saveJSONArray(output, "../MsPackman/data/boardSetup.json");
}


// The following short JSON file called "data.json" is parsed
// in the code below. It must be in the project's "data" folder.
//
// [
//   {
//     "id": 0,
//     "species": "Capra hircus",
//     "name": "Goat"
//   },
//   {
//     "id": 1,
//     "species": "Panthera pardus",
//     "name": "Leopard"
//   },
//   {
//     "id": 2,
//     "species": "Equus zebra",
//     "name": "Zebra"
//   }
// ]
// JSONArray values;
//
// void setup() {
//
// values = loadJSONArray("data.json");
//
// for (int i = 0; i < values.size(); i++) {
//
//   JSONObject animal = values.getJSONObject(i);
//
//   int id = animal.getInt("id");
//   String species = animal.getString("species");
//   String name = animal.getString("name");
//
//   println(id + ", " + species + ", " + name);
// }
// }

// String[] species = { "Capra hircus", "Panthera pardus", "Equus zebra" };
// String[] names = { "Goat", "Leopard", "Zebra" };
//
// JSONArray values;
//
// void setup() {
//
// values = new JSONArray();
//
// for (int i = 0; i < species.length; i++) {
//
//   JSONObject animal = new JSONObject();
//
//   animal.setInt("id", i);
//   animal.setString("species", species[i]);
//   animal.setString("name", names[i]);
//
//   values.setJSONObject(i, animal);
// }
//
// saveJSONArray(values, "data/new.json");
// }