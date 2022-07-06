float a = 0;
float r;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  stroke(20, 150, 20);
  strokeWeight(5);
  fill(0);
  r = (width+height)/4;
  x1 = width/2 + r/2 * cos(a-1.57);
  y1 = height/2 + r/2 * sin(a-1.57);
  x2 = width/2 + r/2 * cos(a-1.87);
  y2 = height/2 + r/2 * sin(a-1.87);
  x3 = width/2 + r/2 * cos(a-2.17);
  y3 = height/2 + r/2 * sin(a-2.17);

  circle(width/2, height/2, r);
  noStroke();
  line(width/2, height/2, x1, y1);
  fill(20, 150, 20);
  triangle(width/2, height/2, x1, y1, x2, y2);
  fill(10, 75, 10);
  triangle(width/2, height/2, x2, y2, x3, y3);
  a+=0.05;
}
