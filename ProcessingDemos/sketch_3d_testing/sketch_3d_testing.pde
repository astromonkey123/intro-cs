float x = 50;
float y = 50;
float a = 0;
float r;
float x1;
float y1;
float x3;
float y3;
float dx = 0;
float dy = 0;

void setup() {
  size(800, 800);
  frameRate(100);
}

void draw() {
  r = (width+height)/4;
  x1 = width/2 + r/2 * cos(a-1.57);
  y1 = height/2 + r/2 * sin(a-1.57);
  //line(width/2, height/2, x1, y1);
  stroke(255);
  strokeWeight(10);
  fill(255);
  translate(x3, y3);
  translate(x1, y1);
  rotate(a);
  point(150, 150);
  x1/=100;
  y1*=100;
  x3+=20;
  y3-=20;
}
