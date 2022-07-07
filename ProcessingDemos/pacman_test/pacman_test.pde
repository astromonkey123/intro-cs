void setup() {
  size(800, 400);

  background(0);
  fill(0);
  stroke(23, 41, 193);
  strokeWeight(10);

  // Obstacles
  line(20, 170, 120, 170);
  line(120, 170, 120, 155);
  line(120, 155, 20, 155);
  line(20, 155, 20, 20);
  line(20, 20, 780, 20);
  line(780, 20, 780, 155);
  line(780, 155, 680, 155);
  line(680, 155, 680, 170);
  line(680, 170, 780, 170);

  line(780, 230, 680, 230);
  line(680, 230, 680, 245);
  line(680, 245, 780, 245);
  line(780, 245, 780, 380);
  line(780, 380, 20, 380);
  line(20, 380, 20, 245);
  line(20, 245, 120, 245);
  line(120, 245, 120, 230);
  line(120, 230, 20, 230);

  rect(80, 80, 40, 15, 5);
  rect(680, 305, 40, 15, 5);

  rect(80, 305, 115, 15, 5);
  rect(720, 80, -115, 15, 5);


  rect(180, 80, 15, 165, 5);
  rect(620, 320, -15, -165, 5);

  rect(255, 380, 15, -75, 5);
  rect(545, 20, -15, 75, 5);

  rect(330, 305, 215, 15, 5);
  rect(545, 320, -15, -165, 5);

  rect(255, 80, 215, 15, 5);
  rect(255, 80, 15, 165, 5);


  rect(330, 245, 140, -90, 5);

  fill(255, 0, 0);
  noStroke();
  rectMode(CENTER);

  // Intersections
  rect(50, 125, 50, 50);
  rect(50, 50, 50, 50);
  rect(50, 350, 50, 50);
  rect(50, 275, 50, 50);
  rect(150, 125, 50, 50);
  rect(150, 50, 50, 50);
  rect(750, 125, 50, 50);
  rect(750, 50, 50, 50);
  rect(750, 350, 50, 50);
  rect(750, 275, 50, 50);
  rect(650, 350, 50, 50);
  rect(650, 275, 50, 50);
  rect(150, 200, 50, 50);
  rect(650, 200, 50, 50);
  rect(650, 125, 50, 50);
  rect(150, 275, 50, 50);
  rect(225, 350, 50, 50);
  rect(225, 275, 50, 50);
  rect(575, 125, 50, 50);
  rect(575, 50, 50, 50);

  rect(300, 350, 50, 50);
  rect(300, 275, 50, 50);
  rect(500, 125, 50, 50);
  rect(500, 50, 50, 50);

  rect(500, 275, 50, 50);
  rect(300, 125, 50, 50);
  rect(575, 350, 50, 50);
  rect(225, 50, 50, 50);

  rectMode(CORNER);
  fill(0);
  noStroke();
  rect(536, 310, -12, 6);
  rect(276, 85, -12, 6);
  rectMode(CENTER);
  rect(400, 160, 70, 20);
  fill(100);
  rect(400, 155, 70, 5);

  noStroke();
  fill(255);
  rectMode(CENTER);


  square(90, 125, 10);
  square(110, 125, 10);
  square(90, 50, 10);
  square(110, 50, 10);
  square(150, 87.5, 10);
  square(50, 87.5, 10);

  square(690, 275, 10);
  square(710, 275, 10);
  square(690, 350, 10);
  square(710, 350, 10);
  square(650, 312.5, 10);
  square(750, 312.5, 10);

  square(500, 87.5, 10);
  square(575, 87.5, 10);
  square(750, 87.5, 10);

  square(50, 312.5, 10);
  square(225, 312.5, 10);
  square(300, 312.5, 10);

  square(90, 275, 10);
  square(110, 275, 10);
  square(690, 125, 10);
  square(710, 125, 10);

  square(500, 170, 10);
  square(500, 190, 10);
  square(500, 210, 10);
  square(500, 230, 10);

  square(300, 170, 10);
  square(300, 190, 10);
  square(300, 210, 10);
  square(300, 230, 10);


  square(350, 275, 10);
  square(370, 275, 10);
  square(390, 275, 10);
  square(410, 275, 10);
  square(430, 275, 10);
  square(450, 275, 10);

  square(350, 125, 10);
  square(370, 125, 10);
  square(390, 125, 10);
  square(410, 125, 10);
  square(430, 125, 10);
  square(450, 125, 10);

  square(90, 350, 10);
  square(109, 350, 10);
  square(128, 350, 10);
  square(147, 350, 10);
  square(166, 350, 10);
  square(185, 350, 10);

  square(615, 50, 10);
  square(634, 50, 10);
  square(653, 50, 10);
  square(672, 50, 10);
  square(691, 50, 10);
  square(710, 50, 10);

  square(340, 350, 10);
  square(360, 350, 10);
  square(380, 350, 10);
  square(400, 350, 10);
  square(420, 350, 10);
  square(455, 350, 10);
  square(475, 350, 10);
  square(495, 350, 10);
  square(515, 350, 10);
  square(535, 350, 10);

  square(265, 50, 10);
  square(360, 350, 10);
  square(380, 350, 10);
  square(400, 350, 10);
  square(420, 350, 10);
  square(455, 350, 10);
  square(475, 350, 10);
  square(495, 350, 10);
  square(515, 350, 10);
  square(535, 350, 10);



  square(225, 90, 10);
  square(225, 110, 10);
  square(225, 130, 10);
  square(225, 150, 10);
  square(225, 175, 10);
  square(225, 195, 10);
  square(225, 215, 10);
  square(225, 235, 10);


}

void draw() {
}

void mousePressed() {
  println(mouseX, mouseY);
  stroke(255);
  strokeWeight(5);
  point(mouseX, mouseY);
}
