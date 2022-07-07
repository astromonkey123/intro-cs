boolean isAlive = true;
boolean allowedUp = false;
boolean allowedDown = false;
boolean allowedLeft = true;
boolean allowedRight = true;
float pac_x = 400;
float pac_y = 350;
float pac_dx = 0;
float pac_dy = 0;
float[][] ghostXY = {{250, 100, 400}, {250, 100, 400}};
int[] ghostType = {0, 1, 2};
String direction = "none";
boolean animationSwitch = true;
int animationStatus = 0;
String whatToDraw = "Start";

void drawStartScreen() {
  background(0);
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(400, 70, 400, 100, 20);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(80);
  text("PAC - MAN", 400, 95);
  drawStartButton();
  drawExitButton();
  drawTutorialButton();
}

void drawStartButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(400, 300, 200, 100, 20);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(70);
  text("Play!", 400, 320);
}

void drawExitButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(650, 325, 150, 75, 10);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(50);
  text("Exit", 650, 340);
}

void drawTutorialButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(150, 325, 150, 75, 10);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(50);
  text("Help", 150, 340);
}

void drawHelpScreen() {
  background(0);
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(400, 50, 200, 75, 20);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(60);
  text("Help", 400, 65);
  drawBackButton();
  fill(238, 203, 88);
  textAlign(CORNER);
  textSize(20);
  text("1. Collect as many dots as possible while not dying to the ghosts.", 50, 150);
  text("2. The large dots allow you to eat ghosts, making you invincible for 10 seconds.", 50, 200);
  text("3. Use the arrow keys to move.", 50, 250);
}

void drawBackButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(100, 350, 120, 60, 10);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(40);
  text("Back", 100, 365);
}

void drawMap() {
  rectMode(CORNER);
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
}

void drawPacman(float x, float y, String direction) {
  fill(255, 251, 83);
  if (direction == "up" && allowedUp) {
    pac_dy = -1;
    pac_dx = 0;
    if (animationStatus >= 0) {
      arc(x, y, 45, 45, radians(300), radians(600), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 45, 45, radians(320), radians(580), PIE);
    }
  } else if (direction == "down" && allowedDown) {
    pac_dy = 1;
    pac_dx = 0;
    if (animationStatus >= 0) {
      arc(x, y, 45, 45, radians(120), radians(420), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 45, 45, radians(140), radians(400), PIE);
    }
  } else if (direction == "left" && allowedLeft) {
    pac_dx = -1;
    pac_dy = 0;
    if (animationStatus >= 0) {
      arc(x, y, 45, 45, radians(210), radians(510), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 45, 45, radians(230), radians(490), PIE);
    }
  } else if (direction == "right" && allowedRight) {
    pac_dx = 1;
    pac_dy = 0;
    if (animationStatus >= 0) {
      arc(x, y, 45, 45, radians(30), radians(330), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 45, 45, radians(50), radians(310), PIE);
    }
  } else if (direction == "none") {
    circle(x, y, 45);
  }
  fill(255, 251, 83);
  if (animationStatus >= 2) {
    animationSwitch = true;
  } else if (animationStatus <= -2) {
    animationSwitch = false;
  }
}

void deathAnimation(float x, float y) {
  fill(255, 251, 83);
  pac_dx = 0;
  pac_dy = 0;
  circle(x, y, 30);
}

void drawGhost(float x, float y, int type) {
  if (type == 0) {
    fill(115, 189, 202);
  } else if (type == 1) {
    fill(222, 149, 188);
  } else if (type == 2) {
    fill(239, 181, 80);
  } else if (type == 3) {
    fill(210, 48, 41);
  }
  push();
  translate(x, y);
  beginShape();
  beginShape();
  vertex(15, 0);
  vertex(15, 20);
  vertex(10, 15);
  vertex(5, 20);
  vertex(0, 15);
  vertex(-5, 20);
  vertex(-10, 15);
  vertex(-15, 20);
  vertex(-15, 0);
  endShape();
  arc(0, 0, 30, 30, radians(180), radians(360), OPEN);
  fill(255);
  circle(-6, -3, 9);
  circle(6, -3, 9);
  strokeWeight(3);
  stroke(0);
  point(6, -3);
  point(-6, -3);
  pop();
}

boolean circleCircleCollisionCheck(float x1, float y1, float d1, float x2, float y2, float d2) {
  float distance = dist(x1, y1, x2, y2);
  return (distance <= d1/2 + d2/2);
}

void checkIntersections() {
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 50, 50, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 50, 125, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 50, 350, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 50, 275, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 150, 125, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 150, 50, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 750, 125, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 750, 50, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 750, 350, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 750, 275, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 650, 350, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 650, 275, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 150, 200, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 650, 200, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 650, 125, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 150, 275, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 225, 350, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 225, 275, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 575, 125, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 575, 50, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 300, 350, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 300, 275, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 500, 125, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 500, 50, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 500, 275, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 300, 125, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 575, 350, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 5, 225, 50, 5)) {
    pac_x = 50;
    pac_y = 50;
    allowedUp = false;
    allowedDown = true;
    allowedLeft = false;
    allowedRight = true;
    if (keyPressed == true && keyCode == DOWN) {
      direction = "down";
      pac_y = 56;
      pac_dx = 0;
      pac_dy = 1;
    } else if (keyPressed == true && keyCode == RIGHT) {
      direction = "right";
      pac_x = 56;
      pac_dx = 1;
      pac_dy = 0;
    } else {
      direction = "none";
      pac_dx = 0;
      pac_dy = 0;
    }
  }
}
void setup() {
  size(800, 400);
}

void draw() {
  if (whatToDraw == "Start") {
    drawStartScreen();
  } else if (whatToDraw == "Help") {
    drawHelpScreen();
  } else if (whatToDraw == "Game") {
    drawMap();
    checkIntersections();
    if (isAlive) {
      drawPacman(pac_x, pac_y, direction);
    } else if (!isAlive) {
      deathAnimation(pac_x, pac_y);
    }
    for (int i = 0; i < ghostXY[0].length; i++) {
      drawGhost(ghostXY[0][i], ghostXY[1][i], ghostType[i]);
    }
    if (keyPressed && keyCode == UP) {
      direction = "up";
    } else if (keyPressed && keyCode == DOWN) {
      direction = "down";
    } else if (keyPressed && keyCode == LEFT) {
      direction = "left";
    } else if (keyPressed && keyCode == RIGHT) {
      direction = "right";
    }
    if (pac_y <= 15) {
      direction = "down";
    } else if (pac_y >= 385) {
      direction = "up";
    }
    if (pac_x <= 15) {
      pac_x = 780;
      direction = "left";
    } else if (pac_x >= 785) {
      pac_x = 20;
      direction = "right";
    }
    pac_x += pac_dx;
    pac_y += pac_dy;
    if (animationSwitch) {
      animationStatus--;
    } else {
      animationStatus++;
    }
    for (int j = 0; j < ghostXY[0].length; j++) {
      ghostXY[0][j] += int(random(-2, 2));
      ghostXY[1][j] += int(random(-2, 2));
    }
    for (int i = 0; i < ghostXY[0].length; i++) {
      double xDif = pac_x - ghostXY[0][i];
      double yDif = pac_y - ghostXY[1][i];
      double distanceSquared = xDif * xDif + yDif * yDif;
      boolean collision = distanceSquared < (15 + 15) * (15 + 15);
      if (collision) {
        isAlive = false;
      }
    }
  }
}

void mousePressed() {
  if (whatToDraw == "Start") {
    if (mouseX > 300 && mouseX < 500 && mouseY > 250 && mouseY < 350) {
      whatToDraw = "Game";
    } else if (mouseX > 575 && mouseX < 725 && mouseY > 290 && mouseY < 360) {
      exit();
    } else if (mouseX > 75 && mouseX < 225 && mouseY > 290 && mouseY < 360) {
      whatToDraw = "Help";
    }
  } else if (whatToDraw == "Help") {
    if (mouseX > 40 && mouseX < 160 && mouseY > 320 && mouseY < 380) {
      whatToDraw = "Start";
    }
  }
}

void keyPressed() {
}
