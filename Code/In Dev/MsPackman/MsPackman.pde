Pacman pac; 

void setup() {
  size(640, 640);
  smooth(); 
  pac = new Pacman();
}

void draw() {
 background(51);  
 pac.move();
 pac.show(); 
}

void keyPressed() {
  if(keyCode == LEFT) {
    pac.setDir(-1, 0); 
  }
  else if(keyCode == RIGHT) {
    pac.setDir(1, 0); 
  }
  else if(keyCode == UP) {
    pac.setDir(0, -1); 
  }
  else if(keyCode == DOWN) {
    pac.setDir(0, 1);
  }
}