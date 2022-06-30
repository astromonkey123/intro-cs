float circle_x;
float circle_y;
int circleCount = 0;

void setup() {
  background(255);
  size(500, 500);
}

void draw() {
  translate(250, 250);
  circle_x = random(-250, 250);
  circle_y = random(-250, 250);
  /*if (circle_x > 0) {
    if (circle_y > 0) {
      fill(0, 200, 0);
    } else if (circle_y <= 0) {
      fill(0, 0, 200);
    }
  } else if (circle_x <= 0) {
    if (circle_y > 0) {
      fill(200, 200, 0);
    } else if (circle_y <= 0) {
      fill(200, 0, 0);
    }
  }*/
  if (circle_x/circle_y > 1 && circle_x < 0) {
    fill(0, 255, 0);
  } else if (circle_x/circle_y > 1 && circle_x > 0) {
    fill(255, 0, 0);
  } else if (circle_y/circle_x < 1) { 
    fill(255, 0, 255);
  }
  circle(circle_x, circle_y, 20);
  circleCount++;
  println(circleCount);
}
