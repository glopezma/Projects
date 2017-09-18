class Hero{
 int x = width/2; 
 int y = height/2; 
 void show(){
   rect(x, y, 20, 20); 
 }
 void move(int dirx, int diry){
   x += dirx*20; 
   y += diry*20; 
 }
}

Hero myChar; 

void setup(){
 size(450, 450);
 myChar = new Hero(); 
}

void draw(){
  background(51); 
  myChar.show();
}

void keyPressed(){
 if(keyCode == LEFT){
   myChar.move(-1, 0); 
 } 
 else if(keyCode == RIGHT){
   myChar.move(1, 0);
 }
 else if(keyCode == UP){
   myChar.move(0, -1);
 }
 else if(keyCode == DOWN){
   myChar.move(0, 1);
 }
}