float x_moving = -250;
float y_pos = 0;
float x_pos = 0;

float x_pos1 = 0;
float y_pos1 = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(124, 152, 255);
  stroke(0);
  strokeWeight(5);
  fill(177, 116, 83);
  circle(x_pos+250, y_pos+100, 30);
  y_pos = x_moving*x_moving/50;
  x_pos = x_moving;
  x_moving+=5;
  noStroke();
  fill(0);
  rect(400, 150, 20, 350);
  rect(330, 480, 120, 20);
  fill(255, 0, 0);
  rect(320, 220, 80, 10);
  noStroke();
  fill(255);
  beginShape();
  vertex(320, 230);
  vertex(340, 275);
  vertex(380, 275);
  vertex(400, 230);
  vertex(390, 230);
  vertex(375, 265);
  vertex(360, 230);
  vertex(345, 265);
  vertex(330, 230);
  endShape(CLOSE);
  /*
  circle(x_pos1, 250, 100);
   circle(250, y_pos1, 100);
   x_pos1++;
   y_pos1++;
   if (x_pos1 > 500) {
   x_pos1 = 0;
   }
   if (y_pos1 > 500) {
   y_pos1 = 0;
   }
   */
}

void mousePressed() {
  stroke(0);
  println(mouseX, mouseY);
}
