/* //<>//
Ethan Rosenfeld
 7/8/2022
 Final Project: Pac-Man
 
 Challenges / Issues:
 - Working with intersections so that I didn't have to set up collisions for the walls
 - Keeping track of all of the different variables
 - Making the ghosts move towards the player while staying on the correct paths
 
 Future Possibilities:
 - Clean up some areas of code
 - Add more animations for player death, ghost movement, etc.
 
 New Information:
 - Found a work-around for mazes
 - Became more familliar with collision logic and keeping track of scores
 
 */

boolean isAlive = true;  // If pacman is alive
boolean isWin = false;   // If the game has been won
boolean[] isFirstGhost = {true, true, true, true};    // Stops the ghosts from moving until out of cage
float[] ghost_dx = {0, 0, 0, 0};    // Change in ghost X
float[] ghost_dy = {0, 0, 0, 0};    // Change in ghost Y
// Coordinates for coins
float[] coinX = {90, 110, 90, 110, 150, 50, 690, 710, 690, 710, 650, 750, 500, 575, 750, 50, 225, 300, 90, 110, 690, 710, 500, 500, 500, 500, 300, 300, 300, 300, 350, 370, 390, 410, 430, 450, 350, 370, 390, 410, 430, 450, 90, 109, 128, 147, 166, 185, 615, 634, 653, 672, 691, 710, 340, 360, 380, 400, 420, 455, 475, 495, 515, 535, 265, 360, 380, 400, 420, 455, 475, 495, 515, 535, 265, 285, 305, 325, 345, 380, 400, 420, 440, 460, 225, 225, 225, 225, 225, 225, 225, 225, 575, 575, 575, 575, 575, 575, 575, 575};
float[] coinXBackup = {90, 110, 90, 110, 150, 50, 690, 710, 690, 710, 650, 750, 500, 575, 750, 50, 225, 300, 90, 110, 690, 710, 500, 500, 500, 500, 300, 300, 300, 300, 350, 370, 390, 410, 430, 450, 350, 370, 390, 410, 430, 450, 90, 109, 128, 147, 166, 185, 615, 634, 653, 672, 691, 710, 340, 360, 380, 400, 420, 455, 475, 495, 515, 535, 265, 360, 380, 400, 420, 455, 475, 495, 515, 535, 265, 285, 305, 325, 345, 380, 400, 420, 440, 460, 225, 225, 225, 225, 225, 225, 225, 225, 575, 575, 575, 575, 575, 575, 575, 575};
float[] coinY = {125, 125, 50, 50, 87.5, 87.5, 275, 275, 350, 350, 312.5, 312.5, 87.5, 87.5, 87.5, 312.5, 312.5, 312.5, 275, 275, 125, 125, 170, 190, 210, 230, 170, 190, 210, 230, 275, 275, 275, 275, 275, 275, 125, 125, 125, 125, 125, 125, 350, 350, 350, 350, 350, 350, 50, 50, 50, 50, 50, 50, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 50, 350, 350, 350, 350, 350, 350, 350, 350, 350, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90, 110, 130, 150, 175, 195, 215, 235, 165, 185, 205, 225, 250, 270, 290, 310};
float[] coinYBackup = {125, 125, 50, 50, 87.5, 87.5, 275, 275, 350, 350, 312.5, 312.5, 87.5, 87.5, 87.5, 312.5, 312.5, 312.5, 275, 275, 125, 125, 170, 190, 210, 230, 170, 190, 210, 230, 275, 275, 275, 275, 275, 275, 125, 125, 125, 125, 125, 125, 350, 350, 350, 350, 350, 350, 50, 50, 50, 50, 50, 50, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 50, 350, 350, 350, 350, 350, 350, 350, 350, 350, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 90, 110, 130, 150, 175, 195, 215, 235, 165, 185, 205, 225, 250, 270, 290, 310};
float[] coinX_Large = {50, 750, 50, 750};
float[] coinXBackup_Large = {50, 750, 50, 750};
float[] coinY_Large = {50, 50, 350, 350};
float[] coinYBackup_Large = {50, 50, 350, 350};
int deathCount = 3;  // Pacman death count
boolean allowedUp = false;    // If pacman is allowed to go a direction
boolean allowedDown = false;
boolean allowedLeft = true;
boolean allowedRight = true;
// Coordinates for intersections
float[] interX = {50, 50, 50, 50, 150, 150, 750, 750, 750, 750, 650, 650, 150, 650, 650, 150, 225, 225, 575, 575, 300, 300, 500, 500, 500, 300, 575, 225};
float[] interY = {125, 50, 350, 275, 125, 50, 125, 50, 350, 275, 350, 275, 200, 200, 125, 275, 350, 275, 125, 50, 350, 275, 125, 50, 275, 125, 350, 50};
// Check if up/down/left/right is allowed at each intersection
boolean[] interUp = {true, false, true, false, true, false, true, false, true, false, true, true, true, true, false, true, true, true, true, false, true, true, true, false, true, false, true, false};
boolean[] interDown = {false, true, false, true, true, true, false, true, false, true, false, true, true, true, true, false, false, true, true, true, false, true, true, true, false, true, false, true};
boolean[] interLeft = {false, false, false, false, true, true, true, true, true, true, true, false, true, false, true, true, true, true, true, false, false, true, true, true, true, false, true, true};
boolean[] interRight = {true, true, true, true, false, true, false, false, false, false, true, true, false, true, true, true, false, true, true, true, true, true, true, false, false, true, true, true};
float pac_x = 300;    // Pacman X
float pac_y = 350;    // Pacman Y
float pac_dx = 0;    // Change in X
float pac_dy = 0;    // Change in Y
float[][] ghostXY = {{360, 386.666, 412.333, 440}, {190, 200, 190, 200}};    // Ghost XY
int[] ghostType = {int(random(0, 4)), int(random(0, 4)), int(random(0, 4)), int(random(0, 4))};    // Ghost color
String direction = "none";    // Pacman direction
// Pacman animation variables
boolean animationSwitch = true;
int animationStatus = 0;
String whatToDraw = "Start";    // Variable to control game screen
int score = 0;    // Game score
int coinsCollected = 0;    // Collected coins count
boolean isOnIntersection = true;    // Check if pacman is on an intersection
boolean[] isGhostOnIntersection = {true, true, true, true};    // Check if ghost is on an intersection
int[] highestScore = new int[0];    // Save highest score in an array
int ghostCount = 0;    // Number of ghosts
boolean isEatingGhosts = false;    // If pacman is invincible
int isEatingGhostsTimer = 0;
boolean[] allowedGhostUp = {false, false, false, false};    // If ghosts are allowed to go in a direction
boolean[] allowedGhostDown = {false, false, false, false};
boolean[] allowedGhostLeft = {true, true, true, true};
boolean[] allowedGhostRight = {true, true, true, true};
String[] ghostDirection = {"left", "right", "left", "right"};    // Ghost direction

//Check if a ghost is on an intersections
void checkGhostIntersection(float x, float y, boolean up, boolean down, boolean left, boolean right) {
  for (int i = 0; i < ghostXY[0].length; i++) {
    if (circleCircleCollisionCheck(ghostXY[0][i], ghostXY[1][i], 2, x, y, 2)) {
      println("Hitting");
      ghost_dx[i] = 0;
      ghost_dy[i] = 0;
      int randomDir = int(random(0, 4));
      isGhostOnIntersection[i] = true;
      ghostXY[0][i] = x;
      ghostXY[1][i] = y;
      allowedGhostUp[i] = up;
      allowedGhostDown[i] = down;
      allowedGhostLeft[i] = left;
      allowedGhostRight[i] = right;
      if (randomDir == 4) {
        direction = "none";
      }
      if (up) {  // If up is allowed
        if (randomDir == 0 && isGhostOnIntersection[i]) {
          ghostXY[1][i] = y-6;
          ghostDirection[i] = "up";
        }
      }
      if (down) {  // If down is allowed
        if (randomDir == 1 && isGhostOnIntersection[i]) {
          ghostXY[1][i]= y+6;
          ghostDirection[i] = "down";
        }
      }
      if (left) {  // If left is allowed
        if (randomDir == 2 && isGhostOnIntersection[i]) {
          ghostXY[0][i] = x-6;
          ghostDirection[i] = "left";
        }
      }
      if (right) {  // If right is allowed
        if (randomDir == 3 && isGhostOnIntersection[i]) {
          ghostXY[0][i] = x+6;
          ghostDirection[i] = "right";
        }
      }
    } else {
      isGhostOnIntersection[i] = false;
    }
  }
}

// Draw coins around the map
void drawCoins() {
  fill(243, 174, 167);
  noStroke();
  for (int i = 0; i < coinX.length; i++) {  // Small coins
    square(coinX[i], coinY[i], 10);
    if (circleCircleCollisionCheck(pac_x, pac_y, 45, coinX[i], coinY[i], 10)) {
      score += 5;
      coinsCollected ++;
      coinX[i] = -100;
      coinY[i] = -100;
    }
  }
  for (int i = 0; i < coinX_Large.length; i++) {  // Large coins
    circle(coinX_Large[i], coinY_Large[i], 20);
    if (circleCircleCollisionCheck(pac_x, pac_y, 45, coinX_Large[i], coinY_Large[i], 10)) {
      score += 20;
      coinX_Large[i] = -100;
      coinY_Large[i] = -100;
      isEatingGhosts = true;
      isEatingGhostsTimer = 700;
    }
  }
}

// Move ghosts
void moveGhosts() {
  if (ghostCount > 0) {  // Bring out the ghosts one by one
    if (isFirstGhost[0]) {
      ghostXY[0][0] = 400;
      ghostXY[1][0] = 125;
      isFirstGhost[0] = false;
    }
    ghostXY[0][0] += ghost_dx[0];
    ghostXY[1][0] += ghost_dy[0];
  }
  if (ghostCount > 1) {
    if (isFirstGhost[1]) {
      ghostXY[0][1] = 400;
      ghostXY[1][1] = 125;
      isFirstGhost[1] = false;
    }
    ghostXY[0][1] += ghost_dx[1];
    ghostXY[1][1] += ghost_dy[1];
  }
  if (ghostCount > 2) {
    if (isFirstGhost[2]) {
      ghostXY[0][2] = 400;
      ghostXY[1][2] = 125;
      isFirstGhost[2] = false;
    }
    ghostXY[0][2] += ghost_dx[2];
    ghostXY[1][2] += ghost_dy[2];
  }
  if (ghostCount > 3) {
    if (isFirstGhost[3]) {
      ghostXY[0][3] = 400;
      ghostXY[1][3] = 125;
      isFirstGhost[3] = false;
    }
    ghostXY[0][3] += ghost_dx[3];
    ghostXY[1][3] += ghost_dy[3];
  }
  for (int i = 0; i < ghostXY[0].length; i++) {  // Find what direction ghosts should be moving
    if (ghostDirection[i] == "up" && allowedGhostUp[i]) {
      ghost_dx[i] = 0;
      ghost_dy[i] = -1.25;
    } else if (ghostDirection[i] == "down" && allowedGhostDown[i]) {
      ghost_dx[i] = 0;
      ghost_dy[i] = 1.25;
    } else if (ghostDirection[i] == "left" && allowedGhostLeft[i]) {
      ghost_dx[i] = -1.25;
      ghost_dy[i] = 0;
    } else if (ghostDirection[i] == "right" && allowedGhostRight[i]) {
      ghost_dx[i] = 1.25;
      ghost_dy[i] = 0;
    } else if (ghostDirection[i] == "none") {
      ghost_dx[i] = 0;
      ghost_dy[i] = 0;
    }
  }
}

// Increase ghost count as game progresses
void changeDifficulty() {
  if (score > 0 && score < 100) {
    ghostCount = 1;
  } else if (score > 0 && score < 200) {
    ghostCount = 2;
  } else if (score > 0 && score < 300) {
    ghostCount = 3;
  } else if (score > 0 && score < 400) {
    ghostCount = 4;
  } else if (score > 0 && score < 600) {
    ghostCount = 4;
  } else {
    ghostCount = 0;
  }
}

// Check and save the highest score
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

// Draw score on screen
void drawScore() {
  fill(255, 251, 83);
  textSize(30);
  textAlign(CORNER);
  text("Score: " + score, 200, 415);
}

// Draw lives on screen
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

// Draw reset button
void playAgainButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(150, 325, 250, 75, 10);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(50);
  text("Play Again!", 150, 340);
}

// Draw score box on end and win screens
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

// Lose screen function
void drawLoseScreen() {
  drawMap();
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

// Win screen function
void drawWinScreen() {
  drawMap();
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

// Check if player lost
void checkIfLose() {
  if (deathCount <= 0) {
    whatToDraw = "Lose";
  }
}

// Check if player won
void checkIfWin() {
  if (coinsCollected >= 100 && deathCount > 0) {
    whatToDraw = "Win";
  }
}

// Check if pacman is hitting a ghost
void checkGhostCollision() {
  for (int i = 0; i < ghostXY[0].length; i++) {
    double xDif = pac_x - ghostXY[0][i];
    double yDif = pac_y - ghostXY[1][i];
    double distanceSquared = xDif * xDif + yDif * yDif;
    boolean collision = distanceSquared < (15 + 15) * (15 + 15);
    if (collision && !isEatingGhosts) {
      isAlive = false;
    } else if (collision && isEatingGhosts) {
      isAlive = true;
    }
    if (isEatingGhostsTimer <= 50 && isEatingGhostsTimer >= 0) {
      isEatingGhosts = false;
    }
  }
}

// Switch pacman animation status
void switchAnimation() {
  if (animationSwitch) {
    animationStatus--;
  } else {
    animationStatus++;
  }
}

// Teleport pacman from side to side
void teleportOnWalls() {
  if (pac_x <= 15) {
    pac_x = 780;
    direction = "left";
  } else if (pac_x >= 785) {
    pac_x = 20;
    direction = "right";
  }
}

// Teleport ghosts from side to side
void teleportGhostOnWalls() {
  for (int i = 0; i < ghostXY[0].length; i++) {
    if (ghostXY[0][i] <= 15) {
      ghostXY[0][i] = 780;
      ghostDirection[i] = "left";
    } else if (ghostXY[0][i] >= 785) {
      ghostXY[0][i] = 20;
      ghostDirection[i] = "right";
    }
  }
}

// Function for start screen
void drawStartScreen() {
  drawMap();
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

// Draw play button
void drawStartButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(400, 300, 200, 100, 20);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(70);
  text("Play!", 400, 320);
}

// Draw quit button
void drawExitButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(650, 325, 150, 75, 10);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(50);
  text("Exit", 650, 340);
}

// Draw help button
void drawTutorialButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(150, 325, 150, 75, 10);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(50);
  text("Help", 150, 340);
}

// Function for tutorial screen
void drawHelpScreen() {
  drawMap();
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
  textSize(25);
  text("Welcome to my version of Pac-Man! The rules are as follows:", 50, 125);
  text("1. Your goal is to collect all the coins and avoid death.", 50, 175);
  text("2. The arrow keys are used to move.", 50, 225);
  text("3. The large coins will allow you to survive from ghosts for 10 seconds.", 50, 275);
}

// Return button for help screen
void drawBackButton() {
  fill(230, 141, 69);
  rectMode(CENTER);
  rect(100, 350, 120, 60, 10);
  fill(238, 203, 88);
  textAlign(CENTER);
  textSize(40);
  text("Back", 100, 365);
}

// Draw the game map
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
}

// Draw pacman
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

// Draw death animation
void deathAnimation(float x, float y) {
  fill(255, 251, 83);
  pac_dx = 0;
  pac_dy = 0;
  circle(x, y, 30);
  isAlive = true;
  pac_x = 300;
  pac_y = 350;
  direction = "none";
  if (score > 100) {
      score -= 100;
  } else {
    score -= score;
  }
}

// Draw ghosts
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
  if (isEatingGhosts) {
    fill(17, 47, 228);
  }
  push();
  translate(x, y);
  beginShape();
  beginShape();
  vertex(18, -5);
  vertex(18, 25);
  vertex(12, 20);
  vertex(6, 25);
  vertex(0, 20);
  vertex(-6, 25);
  vertex(-12, 20);
  vertex(-18, 25);
  vertex(-18, -5);
  endShape();
  arc(0, -5, 36, 36, radians(180), radians(360), OPEN);
  fill(255);
  circle(-7, -8, 11);
  circle(7, -8, 11);
  strokeWeight(3);
  stroke(0);
  point(7, -8);
  point(-7, -8);
  pop();
}

// Circle circle collision check
boolean circleCircleCollisionCheck(float x1, float y1, float d1, float x2, float y2, float d2) {
  float distance = dist(x1, y1, x2, y2);
  return (distance <= d1/2 + d2/2);
}

// Check if pacman is hitting intersection
void checkIntersection(float x, float y, boolean up, boolean down, boolean left, boolean right) {
  if (!isOnIntersection) {
    if (direction == "up" && keyPressed == true && keyCode == DOWN) {
      allowedDown = true;
      direction = "down";
    } else if (direction == "down" && keyPressed == true && keyCode == UP) {
      allowedUp = true;
      direction = "up";
    } else if (direction == "left" && keyPressed == true && keyCode == RIGHT) {
      allowedRight = true;
      direction = "right";
    } else if (direction == "right" && keyPressed == true && keyCode == LEFT) {
      allowedLeft = true;
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
  if (whatToDraw == "Start") {  // Check what stage to draw
    drawStartScreen();
  } else if (whatToDraw == "Help") {
    drawHelpScreen();
  } else if (whatToDraw == "Lose") {
    drawLoseScreen();
  } else if (whatToDraw == "Win") {
    drawWinScreen();
  } else if (whatToDraw == "Game") {
    drawMap();
    drawCoins();
    fill(255);
    for (int i = 0; i < interX.length; i++) {
      checkIntersection(interX[i], interY[i], interUp[i], interDown[i], interLeft[i], interRight[i]);
      checkGhostIntersection(interX[i], interY[i], interUp[i], interDown[i], interLeft[i], interRight[i]);
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
    changeDifficulty();
    moveGhosts();
    teleportOnWalls();
    teleportGhostOnWalls();
    switchAnimation();
    checkGhostCollision();
    drawScore();
    drawDeathCount();
    pac_x += pac_dx;
    pac_y += pac_dy;
    isEatingGhostsTimer -= 0.1;
    checkIfLose();
    checkIfWin();
    for (int i = 0; i < ghostDirection.length; i++) {
      println(ghostDirection[i]);
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
  } else if (whatToDraw == "Lose" || whatToDraw == "Win") {
    if (mouseX > 75 && mouseX < 225 && mouseY > 290 && mouseY < 360) {
      whatToDraw = "Start";
      score = 0;
      coinsCollected = 0;
      deathCount = 3;
      pac_x = 300;
      pac_y = 350;
      pac_dx = 0;
      pac_dy = 0;
      direction = "none";
      ghostCount = 1;
      for (int i = 0; i < coinX.length; i++) {
        coinX[i] = coinXBackup[i];
        coinY[i] = coinYBackup[i];
      }
      for (int i = 0; i < coinX_Large.length; i++) {
        coinX_Large[i] = coinXBackup_Large[i];
        coinY_Large[i] = coinYBackup_Large[i];
      }
      for (int i = 0; i < ghostType.length; i++) {
        ghostType[i] = int(random(0, 4));
      }
      ghostXY[0][0] = 360;
      ghostXY[0][1] = 386.666;
      ghostXY[0][2] = 412.333;
      ghostXY[0][3] = 440;
      ghostXY[1][0] = 190;
      ghostXY[1][1] = 200;
      ghostXY[1][2] = 190;
      ghostXY[1][3] = 200;
      isFirstGhost[0] = true;
      isFirstGhost[1] = true;
      isFirstGhost[2] = true;
      isFirstGhost[3] = true;
      isEatingGhosts = false;
      isEatingGhostsTimer = 0;
      ghostDirection[0] = "left";
      ghostDirection[1] = "right";
      ghostDirection[2] = "left";
      ghostDirection[3] = "right";
      for (int i = 0; i < allowedGhostUp.length; i++) {
        allowedGhostUp[i] = false;
        allowedGhostDown[i] = false;
        allowedGhostLeft[i] = true;
        allowedGhostRight[i] = true;
      }
    }
  }
}

/*
Peer Review:
 
 Maxwell
 - Work on the ghost pathfinding
 - In progress
 - Make the ghosts only able to move in either the X or Y directions
 - Completed
 */
