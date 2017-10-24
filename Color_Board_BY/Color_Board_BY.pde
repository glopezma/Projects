import java.awt.*;
import java.awt.event.*;
import java.awt.Component;

Board board;
int boardSize = 450;
int tileSize = 50;
int numTiles = 450 / 50;
color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
color removeColor;
boolean centered;
int time;

Robot robot;
PVector starting_p;

void setup() {
  size(450, 550);
  board = new Board();
  removeColor = colors[int(random(0, 3))];
  centered = false;
  centerWindow();
  time = millis();

  try {
    robot = new Robot();
    robot.setAutoDelay(0);
    //robot.mouseMove(frame.getX() + 25, frame.getY() + 120);
    starting_p.x = frame.getX() + 25;
    starting_p.y = frame.getY() + 120;
  }
  catch (Exception e) {
    e.printStackTrace();
  }
}

void draw() {
  background(removeColor);
  board.show();

  for (int i = 0; i < numTiles; i++) {
    for (int j = 0; j < numTiles; j++) {
      if (board.tiles[i][j].cColor == removeColor) {
        if (millis() > time + 250) {
          mouseMoveAndClick((frame.getX() + 25) + tileSize * j, (frame.getY() + 120) + tileSize * i);
          time = millis();
        }
      }
    }
  }

  if (noColor(removeColor)) {
    color temp = removeColor;
    while (temp == removeColor) {
      removeColor = colors[int(random(0, 3))];
    }
  }
  fill(255);
  textSize(35);
  text("Remove This Color", 50, 50);
}

boolean noColor(color myColor) {
  for (int i = 0; i < numTiles; i++) {
    for (int j = 0; j < numTiles; j++) {
      if (board.tiles[i][j].cColor == myColor) {
        return false;
      }
    }
  }
  return true;
}

void centerWindow()
{
  if (frame != null && centered == false)
  {
    frame.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
    centered = true;
  }
}

void mousePressed() {
  board.click();
}

void mouseMoveAndClick(int x, int y) {
  robot.mouseMove(x, y);
  robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
  robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
  robot.waitForIdle();
}
