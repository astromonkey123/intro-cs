float ballHeight = 1;

void setup() {
  size(500, 500);
}
void draw() {
  background(0);
  circle(250, -200*Math.abs(sin(ballHeight))+475, 50);
  ballHeight+=0.05;
}
