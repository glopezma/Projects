//import peasy.*;
//import peasy.org.apache.commons.math.*;
//import peasy.org.apache.commons.math.geometry.*;

ArrayList<PVector> points = new ArrayList<PVector>();

//PeasyCam cam; 

float m = 4.0; 
float x = 1.8; 
float y = 1.3; 

void setup() {
  size(800, 600);
  colorMode(HSB); 
  //cam = new PeasyCam(this, 500); 
  
}

void draw(){
  background(0); 
  float dt = 0.01; 
  float dx = (m*(x-(1/3)*x*x*x-y))*dt;
  float dy = (x/m)*dt; 
  
  x = x + dx; 
  y = y + dy; 
  print(x); 
  print(y); 
  
  points.add(new PVector(x, y)); 
     translate(width/2, height/2); 
  scale(5); 
  stroke(255); 
  //noFill();
  
  float hu = 0; 
  //beginShape();
  for(PVector v : points) {
   stroke(hu, 255, 255); 
   point(v.x, v.y); 
   
   hu += 0.1; 
   if(hu > 255){
     hu = 0; 
   }
  }
}