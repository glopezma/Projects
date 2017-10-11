class Pacman extends Agent{
  boolean open;
  float mouth; 
  Pacman() {
   super();  
   open = false;
   mouth = radians(0); 
  }
  
  
  
  void show() {
   fill(230, 20, 147);  
   arc(loc.x, loc.y, 25, 25, 0, 2*PI, PIE);
  }
}