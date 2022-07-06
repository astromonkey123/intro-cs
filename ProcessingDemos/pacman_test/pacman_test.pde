void setup() {
  size(800, 410);
  background(0);
  fill(0);
  stroke(23, 41, 193);
  strokeWeight(10);

  // Obstacles
  line(20, 175, 120, 175);
  line(120, 175, 120, 155);
  line(120, 155, 20, 155);
  line(20, 155, 20, 20);
  line(20, 20, 780, 20);
  line(780, 20, 780, 155);
  line(780, 155, 680, 155);
  line(680, 155, 680, 175);
  line(680, 175, 780, 175);

  line(780, 235, 680, 235);
  line(680, 235, 680, 255);
  line(680, 255, 780, 255);
  line(780, 255, 780, 390);
  line(780, 390, 20, 390);
  line(20, 390, 20, 255);
  line(20, 255, 120, 255);
  line(120, 255, 120, 235);
  line(120, 235, 20, 235);

  rect(80, 80, 40, 15, 5);
  rect(680, 315, 40, 15, 5);

  rect(80, 315, 115, 15, 5);
  rect(720, 80, -115, 15, 5);


  rect(180, 80, 15, 175, 5);
  rect(620, 330, -15, -175, 5);

  fill(255, 0, 0);
  noStroke();
  rectMode(CENTER);

  // Intersections
  rect(50, 125, 50, 50);
  rect(50, 50, 50, 50);
  rect(50, 360, 50, 50);
  rect(50, 285, 50, 50);
  rect(150, 125, 50, 50);
  rect(150, 50, 50, 50);
  rect(750, 125, 50, 50);
  rect(750, 50, 50, 50);
  rect(750, 360, 50, 50);
  rect(750, 285, 50, 50);
  rect(650, 360, 50, 50);
  rect(650, 285, 50, 50);
  rect(150, 205, 50, 50);
  rect(650, 205, 50, 50);
  rect(650, 125, 50, 50);
  rect(150, 285, 50, 50);
}

void draw() {
}

void mousePressed() {
  stroke(255);
  strokeWeight(5);
  point(mouseX, mouseY);
  println(mouseX, mouseY);
}
