float[] rain_y = new float[0];
float[] rain_yBackup = new float[1000];
float[] rain_x = new float[0];
float[] rain_xBackup = new float[1000];
float rainSpeed_y = 10;
float puddleCap = 500;

void tearDrop(float xPosition, float yPosition) {
  push();
  translate(xPosition, yPosition);
  scale(0.25);
  arc(0, 0, 100, 100, radians(-20), radians(200), OPEN);
  triangle(-47, -18, 46, -18, 0, -200);
  pop();
}

void drawPuddle(float yCap) {
  fill(30, 30, 255);
  rect(0, yCap, 500, 500);
  fill(0);
  textSize(30);
  text("Puddle Depth: " + abs(yCap-500), 20, 50);
}

void setup() {
  size(500, 500);
}

void draw() {
  background(150);
  drawPuddle(puddleCap);
  for (int i = 0; i < rain_y.length; i++) {
    fill(30, 30, 255);
    tearDrop(rain_x[i], rain_y[i]);
    rain_y[i] += rainSpeed_y;
    if (rain_y[i] >= puddleCap && rain_y[i] < puddleCap+11) {
      puddleCap--;
    }
  }
}

void mousePressed() {
  for(int i = 0; i < rain_y.length; i++) {
    rain_yBackup[i] = rain_y[i]; 
  }
  rain_y = new float[rain_y.length+1];
  for (int i = 0; i < rain_y.length; i++) {
    rain_y[i] = rain_yBackup[i];
  }
  rain_y[rain_y.length-1] = mouseY;
  
  for(int i = 0; i < rain_x.length; i++) {
    rain_xBackup[i] = rain_x[i]; 
  }
  rain_x = new float[rain_x.length+1];
  for (int i = 0; i < rain_x.length; i++) {
    rain_x[i] = rain_xBackup[i];
  }
  rain_x[rain_x.length-1] = mouseX;
}
