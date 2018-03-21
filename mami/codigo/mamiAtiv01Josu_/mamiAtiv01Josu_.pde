/// MAMI ///
/// Josué dos Santos ///

PImage img;
float max_distance;

void setup() {
  size(640, 522);
  noStroke();
  max_distance = dist(0, 0, width, height);
  img = loadImage("js.jpg");
}

void draw() {
  background(img);

  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 60;
      
      ellipse(i, j, size, size);
    }
  }
}