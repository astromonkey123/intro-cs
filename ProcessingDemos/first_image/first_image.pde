void setup() {
  size(500, 500);
  noStroke();
  background(124, 152, 255);
  
  fill(150, 200, 200);
  triangle(425, 375, 0, 375, 425, 0);
  triangle(375, 425, 0, 425, 375, 0);
  
  fill(200, 150, 200);
  triangle(0, 0, 0, 500, 500, 0);
  circle(250, 250, 250);
  square(250, 250, 125);
  
  fill(150, 200, 200);
  ellipse(375, 375, 200, 100);
  ellipse(375, 375, 100, 200);
  
  fill(200, 150, 200);
  circle(375, 375, 125);
}

void draw() {
 
}
