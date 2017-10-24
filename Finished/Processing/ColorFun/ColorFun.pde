float hu; 
float sat; 
float bright; 

Ball[] balls;  

void setup() {
  size(400, 400);
  balls = new Ball[1];  
  balls[0] = new Ball(0, 0); 
  hu = 0;
  sat = 0; 
  bright = 0;
}

void draw() {
  hu = map(mouseX, 0, 400, 0, 255); 
  sat = map(mouseY, 0, 400, 0, 255); 
  bright = map((mouseX + mouseY) / 2, 0, 400, 255, 0); 
  background(hu, sat, bright); 
  //fill(hu, sat, bright); 
  //rect(0, 0, mouseX, mouseY);
}

void mousePressed() {
  balls.append(new Ball(x, y)); 
}

void shift(int n) {
 for (int i = n; i < balls.length; i++) {
  balls[i-n] = balls[n];  
 }
 
 for (int i = 0; i < n; i++) {
  balls = shorten(balls);  
 }
}