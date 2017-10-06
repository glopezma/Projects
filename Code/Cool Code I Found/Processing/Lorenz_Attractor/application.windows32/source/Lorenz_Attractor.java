import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 
import peasy.org.apache.commons.math.*; 
import peasy.org.apache.commons.math.geometry.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Lorenz_Attractor extends PApplet {





// Daniel Shiffman 
// http://codingtra.in 
// http://patreon.com/codingtrain 
// Code for this video: https://youtu.be/f0lkz2gSsIk 
 
 
 float x = 0.01f; 
 float y = 0; 
 float z = 0; 
 
 
 float a = 10; 
 float b = 28; 
 float c = 8.0f/3.0f; 
 
 
 ArrayList<PVector> points = new ArrayList<PVector>(); 
 
 
 PeasyCam cam; 
 
 
 public void setup() { 
   //size(800, 600, P3D); 
   
   colorMode(HSB); 
   cam = new PeasyCam(this, 500); 
 } 
 
 
 public void draw() { 
   background(0); 
   float dt = 0.01f; 
   float dx = (a * (y - x))*dt; 
   float dy = (x * (b - z) - y)*dt; 
   float dz = (x * y - c * z)*dt; 
   x = x + dx; 
   y = y + dy; 
   z = z + dz; 
 
 
   points.add(new PVector(x, y, z)); 
 
 
   translate(0, 0, -80); 
   //translate(width/2, height/2); 
   scale(5); 
   stroke(255); 
   noFill(); 
 
 
   float hu = 0; 
   beginShape(); 
   for (PVector v : points) { 
     stroke(hu, 255, 255); 
     vertex(v.x, v.y,v.z); 
     //PVector offset = PVector.random3D(); 
     //offset.mult(0.1); 
     //v.add(offset); 
 
 
     hu += 0.1f; 
     if (hu > 255) { 
       hu = 0; 
     } 
   } 
   endShape(); 
 
 
 
 
   //println(x,y,z); 
 } 
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lorenz_Attractor" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
