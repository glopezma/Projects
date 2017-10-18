// ControlP5 cp5;
// java.io.File folder;
// String[] fileNames;

// boolean menu = false;
// BufferedReader reader;
// PrintWriter writer;
// int score;
// int numWidth;
// int numHeight;
// int tileSize;
// int boardWidth;
// int boardHeight;
//
// Pacman pac;
// Board board;

// void menu() {
//   background(155);
//   fill(255, 0, 0);
//   stroke(0);
//   strokeWeight(2);
//   rect(5, 5, 50, 50);
//   fill(0);
//   strokeWeight(0);
//   textSize(50);
//   text("X", 15, 50);
// }

// This function returns all the files in a directory as an array of Strings
// String[] listFileNames(String dir) {
//   File file = new File(dir);
//   if (file.isDirectory()) {
//     String names[] = file.list();
//     return names;
//   } else {
//     // If it's not a directory
//     return null;
//   }
// }

boolean inBounds(int x, int y) {
  return (x >= 0 && x < numWidth && y >= 0 && y < numHeight);
}

// void dropdown(int n) {
//   println(n, cp5.get(ScrollableList.class, "dropdown").getItem(n));
//
// }
