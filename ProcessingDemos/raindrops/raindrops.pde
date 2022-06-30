float[] rain_y = {246, 133, 234, 327, 127, 23, 254, 489, 412, 213, 196, 76};
float[] rain_x = {372, 142, 213, 43, 376, 478, 198, 312, 53, 324, 263, 432};
float rainSpeed_y = 10;

void tearDrop(float xPosition, float yPosition) {
  push();
  translate(xPosition, yPosition);
  scale(0.25);
  arc(0, 0, 100, 100, radians(-20), radians(200), OPEN);
  triangle(-47, -18, 46, -18, 0, -100);
  pop();
}


void setup() {
  size(500, 500);
}

void draw() {
  background(150);
  fill(30, 30, 255);
  tearDrop(rain_x[0], rain_y[0]);
  tearDrop(rain_x[1], rain_y[1]);
  tearDrop(rain_x[2], rain_y[2]);
  tearDrop(rain_x[3], rain_y[3]);
  tearDrop(rain_x[4], rain_y[4]);
  tearDrop(rain_x[5], rain_y[5]);
  tearDrop(rain_x[6], rain_y[6]);
  tearDrop(rain_x[7], rain_y[7]);
  tearDrop(rain_x[8], rain_y[8]);
  tearDrop(rain_x[9], rain_y[9]);
  tearDrop(rain_x[10], rain_y[10]);
  tearDrop(rain_x[11], rain_y[11]);
  for (int i = 0; i < rain_y.length; i++) {
    rain_y[i] += rainSpeed_y;
    if (rain_y[i] >= 500) {
      rain_y[i]=0;
      rain_x[i]=random(500);
    }
  }
}
