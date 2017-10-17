class Cube {
 int x;
 int y;
 int z;

  Cube(){
  x = width/2;
  y = height/2;
  z = 0;
 }

 Cube(int x){
  this.x = x;
  this.y = x;
  this.z = x;
 }

 Cube(int x, int y, int z){
  this.x = x;
  this.y = y;
  this.z = z;
 }

 void show(){
  box(40);
 }

 void move(int x, int y, int z){
   this.x += x;
   this.y += y;
   this.z += z;
 }
}
