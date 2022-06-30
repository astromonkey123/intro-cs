float circleSize = 0;
boolean sizeComplete = false;
boolean colorChange = false;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  background(0);
  // Change color each time circle changes direction of transformation
  if (colorChange == false && sizeComplete == false) {
    fill(random(0, 255), random(0, 255), random(0, 255));
    colorChange = true;
  } else if (colorChange == true && sizeComplete == true) {
    fill(random(0, 255), random(0, 255), random(0, 255));
    colorChange = false;
  }
  
  circle(250, 250, circleSize);
  if (circleSize >= 500) {
    sizeComplete = true;
  } else if (circleSize <= 0) {
    sizeComplete = false;
  }
  if (sizeComplete == false) {
    circleSize+=5;
  } else if (sizeComplete == true) {
    circleSize-=5;
  }
}
