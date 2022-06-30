/*
Ethan Rosenfeld
 6/23/2022
 Robot/Monster but animated
 */

float y_movement = 1;                              // Variables for movement
float star_speed = 3;
float star_coord = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  noStroke();
  // Stars
  fill(255, 255, 255);
  circle(star_coord, star_coord/2, 5);            // Moving Stars
  circle(star_coord+200, star_coord-400/2, 7);
  circle(star_coord+300, star_coord/2, 3);
  circle(star_coord+100, star_coord+200/2, 5);
  circle(star_coord-200, star_coord+200/2, 9);
  circle(200, 200, 9);                            // Stationary Stars
  circle(200, 100, 4);
  circle(300, 250, 7);
  circle(400, 200, 6);
  circle(50, 300, 9);
  star_coord+=star_speed;
  if (star_coord > 500) {
    star_coord = 0;
  }

  // Earth
  fill(200, 200, 200);            // Sun glare
  circle(80, 29, 250);

  fill(50, 128, 217);             // Water
  circle(75, 25, 250);

  fill(28, 133, 54);              // Land
  ellipse(20, 40, 60, 110);
  ellipse(40, 10, 120, 50);
  ellipse(70, 70, 20, 40);
  ellipse(150, 10, 70, 110);
  fill(229, 205, 172);
  ellipse(20, 15, 70, 60);

  //Sun
  fill(220, 150, 20);             // Surface
  circle(450, 300, 50);

  // Moon
  fill(100, 100, 100);            // Surface
  circle(250, 1500, 2350);

  fill(50, 50, 50);               // Shadow
  ellipse(30*sin(y_movement)+200, -20*sin(y_movement)+420, 250, 100);

  push();

  translate(0, (30*sin(y_movement)-30));
  y_movement+=0.04;

  // Creature
  stroke(150, 150, 150);          // Legs
  strokeWeight(7);
  fill(250, 100, 40);
  ellipse(225, 350, 20, 100);
  ellipse(275, 350, 20, 100);

  rect(175, 200, 150, 150);       // Body

  circle(250, 150, 100);          // Head
  strokeWeight(3);
  stroke(255, 255, 255);
  fill(142, 152, 255);

  rect(245, 150, 10, 20);         // Nose
  fill(124, 152, 255);

  circle(225, 150, 20);           // Eyes
  circle(275, 150, 20);

  stroke(150, 150, 150);          // Arms
  strokeWeight(7);
  line(175, 250, 100, 200);
  line(325, 250, 400, 300);

  strokeWeight(28);               // Hands
  point(100, 200);
  point(400, 300);
  strokeWeight(15);
  stroke(250, 100, 40);
  point(100, 200);
  point(400, 300);

  noStroke();                     // Heart
  fill(160, 30, 50);
  circle(200, 230, 20);
  circle(220, 230, 20);
  stroke(160, 30, 50);
  strokeWeight(21);
  line(220, 230, 210, 240);
  line(200, 230, 210, 240);

  fill(124, 152, 255);            // Details
  strokeWeight(5);
  stroke(100, 100, 100);
  circle(290, 235, 30);
  stroke(255, 255, 255);
  strokeWeight(12);
  point(290, 235);
  strokeWeight(2);
  for (int i = 0; i < 4; i++) {
    rect(210, 265 + i*20, 80, 10);
  }

  pop();

  // Name
  fill(255);
  textSize(18);
  text("Ethan Rosenfeld", 355, 480);
}
