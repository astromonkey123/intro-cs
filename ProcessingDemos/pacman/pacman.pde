boolean isAlive = true;
boolean isWin = false;
float[] coinX = {90, 110, 90, 110, 150, 50, 690, 710, 690, 710, 650, 750, 500, 575, 750, 50, 225, 300, 90, 110, 690, 710, 500, 500, 500, 500, 300, 300, 300, 300, 350, 370, 390, 410, 430, 450, 350, 370, 390, 410, 430, 450, 90, 109, 128, 147, 166, 185, 615, 634, 653, 672, 691, 710, 340, 360, 380, 400, 420, 455, 475, 495, 515, 535, 265, 360, 380, 400, 420, 455, 475, 495, 515, 535, 265, 285, 305, 325, 345, 380, 400, 420, 440, 460, 225, 225, 225, 225, 225, 225, 225, 225, 575, 575, 575, 575, 575, 575, 575, 575};
float[] coinXBackup = {90, 110, 90, 110, 150, 50, 690, 710, 690, 710, 650, 750, 500, 575, 750, 50, 225, 300, 90, 110, 690, 710, 500, 500, 500, 500, 300, 300, 300, 300, 350, 370, 390, 410, 430, 450, 350, 370, 390, 410, 430, 450, 90, 109, 128, 147, 166, 185, 615, 634, 653, 672, 691, 710, 340, 360, 380, 400, 420, 455, 475, 495, 515, 535, 265, 360, 380, 400, 420, 455, 475, 495, 515, 535, 265, 285, 305, 325, 345, 380, 400, 420, 440, 460, 225, 225, 225, 225, 225, 225, 225, 255, 575, 575, 575, 575, 575, 575, 575, 575};
float[] coinY = {125, 125, 50, 50, 87.5, 87.5, 275, 275, 350, 350, 312.5, 312.5, 87.5, 87.5, 87.5, 312.5, 312.5, 312.5, 275, 275, 125, 125, 170, 190, 210, 230, 170, 190, 210, 230, 275, 275, 275, 275, 275, 275, 125, 125, 125, 125, 125, 125, 350, 350, 350, 350, 350, 350, 50, 50, 50, 50, 50, 50, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 50, 350, 350, 350, 350, 350, 350, 350, 350, 350, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90, 110, 130, 150, 175, 195, 215, 235, 165, 185, 205, 225, 250, 270, 290, 310};
float[] coinYBackup = {125, 125, 50, 50, 87.5, 87.5, 275, 275, 350, 350, 312.5, 312.5, 87.5, 87.5, 87.5, 312.5, 312.5, 312.5, 275, 275, 125, 125, 170, 190, 210, 230, 170, 190, 210, 230, 275, 275, 275, 275, 275, 275, 125, 125, 125, 125, 125, 125, 350, 350, 350, 350, 350, 350, 50, 50, 50, 50, 50, 50, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 50, 350, 350, 350, 350, 350, 350, 350, 350, 350, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90, 110, 130, 150, 175, 195, 215, 235, 165, 185, 205, 225, 250, 270, 290, 310};
int deathCount = 3;
boolean allowedUp = false;
boolean allowedDown = false;
boolean allowedLeft = true;
boolean allowedRight = true;
float[] interX = {50, 50, 50, 50, 150, 150, 750, 750, 750, 750, 650, 650, 150, 650, 650, 150, 225, 225, 575, 575, 300, 300, 500, 500, 500, 300, 575, 225};
float[] interY = {125, 50, 350, 275, 125, 50, 125, 50, 350, 275, 350, 275, 200, 200, 125, 275, 350, 275, 125, 50, 350, 275, 125, 50, 275, 125, 350, 50};
boolean[] interUp = {true, false, true, false, true, false, true, false, true, false, true, true, true, true, false, true, true, true, true, false, true, true, true, false, true, false, true, false};
boolean[] interDown = {false, true, false, true, true, true, false, true, false, true, false, true, true, true, true, false, false, true, true, true, false, true, true, true, false, true, false, true};
boolean[] interLeft = {false, false, false, false, true, true, true, true, true, true, true, false, true, false, true, true, true, true, true, false, false, true, true, true, true, false, true, true};
boolean[] interRight = {true, true, true, true, false, true, false, false, false, false, true, true, false, true, true, true, false, true, true, true, true, true, true, false, false, true, true, true};
float pac_x = 300;
float pac_y = 350;
float pac_dx = 0;
float pac_dy = 0;
float[][] ghostXY = {{350, 400, 450}, {200, 200, 200}};
int[] ghostType = {0, 1, 2};
String direction = "none";
boolean animationSwitch = true;
int animationStatus = 0;
String whatToDraw = "Start";
int score = 0;
int coinsCollected = 0;
boolean isOnIntersection = true;
int[] highestScore = new int[0];

int checkHighestScore() {
  int highest = 0;
  highestScore = append(highestScore, score);
  for (int i = 0; i < highestScore.length; i++) {
    if (highestScore[i] > highest) {
      highest = highestScore[i];
    }
  }
  return highest;
}

void drawScore() {
  fill(255, 251, 83);
  textSize(30);
  textAlign(CORNER);
  text("Score: " + score, 200, 415);
}
void drawDeathCount() {
  fill(255, 251, 83);
  textSize(30);
  textAlign(CORNER);
  text("Lives:", 15, 415);
  if (deathCount == 3) {
    circle(100, 405, 20);
    circle(125, 405, 20);
    circle(150, 405, 20);
  } else if (deathCount == 2) {
    circle(100, 405, 20);
    circle(125, 405, 20);
  } else if (deathCount == 1) {
    circle(100, 405, 20);
  }
}

void playAgainButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(150, 325, 250, 75, 10);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(50);
  text("Play Again!", 150, 340);
}

void drawScoreBox() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(400, 185, 350, 80, 20);
  rect(400, 225, 250, 80, 20);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(50);
  text("Your Score: " + score, 400, 205);
  textSize(30);
  text("Highest score: " + checkHighestScore(), 400, 245);
}

void drawLoseScreen() {
  background(0);
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(400, 70, 400, 100, 20);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(80);
  text("You Lost!", 400, 95);
  drawScoreBox();
  playAgainButton();
}

void drawWinScreen() {
  background(0);
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(400, 70, 400, 100, 20);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(80);
  text("You Won!", 400, 95);
  drawScoreBox();
  playAgainButton();
}

void checkIfLose() {
  if (deathCount <= 0) {
    whatToDraw = "Lose";
  }
}

void checkIfWin() {
  if (coinsCollected >= 100 && deathCount > 0) {
    whatToDraw = "Win";
  }
}

void checkGhostCollision() {
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

void switchAnimation() {
  if (animationSwitch) {
    animationStatus--;
  } else {
    animationStatus++;
  }
}

void teleportOnWalls() {
  if (pac_x <= 15) {
    pac_x = 780;
    direction = "left";
  } else if (pac_x >= 785) {
    pac_x = 20;
    direction = "right";
  }
}

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
  rectMode(CORNER);
  fill(0);
  noStroke();
  rect(536, 310, -12, 6);
  rect(276, 85, -12, 6);
  rectMode(CENTER);
  rect(400, 160, 70, 20);
  fill(100);
  rect(400, 155, 70, 5);

  fill(243, 174, 167);
  noStroke();
  for (int i = 0; i < coinX.length; i++) {
    square(coinX[i], coinY[i], 10);
    if (circleCircleCollisionCheck(pac_x, pac_y, 45, coinX[i], coinY[i], 10)) {
      score += 5;
      coinsCollected ++;
      coinX[i] = -100;
      coinY[i] = -100;
    }
  }
}

void drawPacman(float x, float y, String direction) {
  fill(255, 251, 83);
  if (direction == "up" && allowedUp) {
    pac_dy = -1.25;
    pac_dx = 0;
    if (animationStatus >= 0) {
      arc(x, y, 45, 45, radians(300), radians(600), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 45, 45, radians(320), radians(580), PIE);
    }
  } else if (direction == "down" && allowedDown) {
    pac_dy = 1.25;
    pac_dx = 0;
    if (animationStatus >= 0) {
      arc(x, y, 45, 45, radians(120), radians(420), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 45, 45, radians(140), radians(400), PIE);
    }
  } else if (direction == "left" && allowedLeft) {
    pac_dx = -1.25;
    pac_dy = 0;
    if (animationStatus >= 0) {
      arc(x, y, 45, 45, radians(210), radians(510), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 45, 45, radians(230), radians(490), PIE);
    }
  } else if (direction == "right" && allowedRight) {
    pac_dx = 1.25;
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
  isAlive = true;
  pac_x = 400;
  pac_y = 350;
  direction = "none";
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

void checkIntersection(float x, float y, boolean up, boolean down, boolean left, boolean right) {
  if (!isOnIntersection) {
    if (direction == "up" && keyPressed == true && keyCode == DOWN) {
      direction = "down";
    } else if (direction == "down" && keyPressed == true && keyCode == UP) {
      direction = "up";
    } else if (direction == "left" && keyPressed == true && keyCode == RIGHT) {
      direction = "right";
    } else if (direction == "right" && keyPressed == true && keyCode == LEFT) {
      direction = "left";
    }
  }
  if (circleCircleCollisionCheck(pac_x, pac_y, 2, x, y, 2)) {
    isOnIntersection = true;
    pac_x = x;
    pac_y = y;
    allowedUp = up;
    allowedDown = down;
    allowedLeft = left;
    allowedRight = right;
    if (!keyPressed) {
      direction = "none";
    }
    if (up) {
      if (keyPressed == true && keyCode == UP && isOnIntersection) {
        direction = "up";
        pac_y = y-6;
      }
    }
    if (down) {
      if (keyPressed == true && keyCode == DOWN && isOnIntersection) {
        direction = "down";
        pac_y = y+6;
      }
    }
    if (left) {
      if (keyPressed == true && keyCode == LEFT && isOnIntersection) {
        direction = "left";
        pac_x = x-6;
      }
    }
    if (right) {
      if (keyPressed == true && keyCode == RIGHT && isOnIntersection) {
        direction = "right";
        pac_x = x+6;
      }
    }
  } else {
    isOnIntersection = false;
  }
}

void setup() {
  size(800, 430);
}

void draw() {
  if (whatToDraw == "Start") {
    drawStartScreen();
  } else if (whatToDraw == "Help") {
    drawHelpScreen();
  } else if (whatToDraw == "Lose") {
    drawLoseScreen();
  } else if (whatToDraw == "Win") {
    drawWinScreen();
  } else if (whatToDraw == "Game") {
    drawMap();
    fill(255);
    for (int i = 0; i < interX.length; i++) {
      circle(interX[i], interY[i], 5);
      checkIntersection(interX[i], interY[i], interUp[i], interDown[i], interLeft[i], interRight[i]);
    }
    if (isAlive) {
      drawPacman(pac_x, pac_y, direction);
    } else if (!isAlive) {
      deathAnimation(pac_x, pac_y);
      deathCount--;
    }
    for (int i = 0; i < ghostXY[0].length; i++) {
      drawGhost(ghostXY[0][i], ghostXY[1][i], ghostType[i]);
    }
    teleportOnWalls();
    switchAnimation();
    checkGhostCollision();
    drawScore();
    drawDeathCount();
    pac_x += pac_dx;
    pac_y += pac_dy;
    checkIfLose();
    checkIfWin();
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
  } else if (whatToDraw == "Lose" || whatToDraw == "Win") {
    if (mouseX > 75 && mouseX < 225 && mouseY > 290 && mouseY < 360) {
      whatToDraw = "Start";
      score = 0;
      coinsCollected = 0;
      deathCount = 3;
      pac_x = 400;
      pac_y = 350;
      for (int i = 0; i < coinX.length; i++) {
        coinX[i] = coinXBackup[i];
        coinY[i] = coinYBackup[i];
      }
    }
  }
}
