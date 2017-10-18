PImage img; 
int di; 

void setup() {
  di = 16; 
  fullScreen(); 
  img = loadImage("th.jpg"); 
  img.resize(width, height); 
  background(0); 
}

void draw() {
  for (int i = 0; i < 500; i++) {
    int x = int(random(img.width)); 
    int y = int(random(img.height));
    int loc = x + y*img.width; 

    loadPixels(); 
    float r = red(img.pixels[loc]); 
    float g = green(img.pixels[loc]); 
    float b = blue(img.pixels[loc]); 
    noStroke(); 

    fill(r, g, b, 75); 
    //fill(255); 
    ellipse(x, y, di, di); 
    //image(img, 0, 0, width, height);
  }
}