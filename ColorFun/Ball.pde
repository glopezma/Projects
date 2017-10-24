class Ball {
  float x; 
  float y; 
  float diry; 
  float dirx; 
  float xvel; 
  float yvel; 

  Ball(int x, int y) {
    float chance = random(100); 
    this.x = mouseX;  
    this.y = mouseY;
    
    dirx = x; 
    diry = y;
    
  }

  void show() {
    fill(hu, sat, bright); 
    ellipse(x, y, 15, 15);
  }

  void update() {
  }
}