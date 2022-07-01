float r = 124;
float g = 152;
float b = 255;

void setup() {
  background(0);
  stroke(255);
  size(500, 500);
  strokeWeight(2);
  for (int i = 0; i < 500; i += 50) {
    for (int j = 0; j < 500; j += 50) {
      fill(0);
      square(i, j, 50);
      line(i, j, i+50, j+50);
      line(i+50, j, i, j+50);
      fill(r, g, b);
      triangle(i, j+50, i+50, j+50, i+25, j+25);
      fill(0.666*r, 0.666*g, 0.666*b);
      triangle(i, j, i, j+50, i+25, j+25);
      fill(0.333*r, 0.333*g, 0.333*b);
      triangle(i, j, i+50, j, i+25, j+25);
    }
  }
}
