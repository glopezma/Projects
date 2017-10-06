ArrayList<Cube> cubes;
int numCubes = 3;

void setup() {
  size(600, 450, P3D);
  cubes = new ArrayList<Cube>();

  for (int i = 0; i<numCubes; i++) {
    cubes.add(new Cube());
  }

  cubes.get(1).move(-40, 0, 0);
  cubes.get(2).move(0, -40, 0);
}

void draw() {
  background(51);
  lights();
  //noStroke();

  //camera(frameCount, frameCount, 0, width/2, height/2, 0, 0, 1, 0);

  for (int i = 0; i<cubes.size(); i++) {
    pushMatrix();
    translate(cubes.get(i).x, cubes.get(i).y);
    rotateX(PI/4);
    cubes.get(i).show();
    popMatrix();
    rotateY(frameCount * 0.01);
  }
}
