boolean isHittingLeft = false;       // If ball hits left bumper
boolean isHittingRight = false;      // If ball hits right bumper
float circleX = 250;                 // Ball Y coordinate
float circleY = 250;                 // Ball X coordinate
float speedX = 0;                    // Ball speed in Y
float speedY = 0;                    // Ball speed in X
int scoreLeft = 0;                   // Score for left side
int scoreRight = 0;                  // Score for right side
float[] speedXY = new float[2];      // Array for X and Y speed on start
float rightPaddleY = 250;            // Right paddle up/down movement
float leftPaddleY = 250;             // Left paddle up/down movement

// Check if ball hits left bumper
boolean ballHittingLeft(float bumperY, float ballY, float ballX) {
  if (bumperY < ballY && ballY < bumperY+100) {
    if (62.5 > ballX && ballX > 47.5) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

//Check if ball hits right bumper
boolean ballHittingRight(float bumperY, float ballY, float ballX) {
  if (bumperY < ballY && ballY < bumperY+100) {
    if (442.5 < ballX && ballX < 457.5) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

// Randomization of ball X and Y speed on start
void pickSpeed() {
  float randX = random(-3, 3);
  if (randX >= 0) {
    randX+=2;
  } else if (randX < 0) {
    randX-=2;
  }
  speedXY[0] = randX;
  float randY = random(-1, 1);
  if (randY >= 0) {
    randY+=1;
  } else if (randY < 0) {
    randY-=1;
  }
  speedXY[1] = randY;
}

void setup() {
  size(500, 500);
  pickSpeed();
  speedX = speedXY[0];
  speedY = speedXY[1];
}

void draw() {
  background(0);
  fill(255);
  for (int i = 0; i < 500; i+=50) {
    rect(245, i, 10, 25);
  }
  fill(255);
  if (keyCode == UP && keyPressed) {
    if (rightPaddleY > 0) {
      rightPaddleY-=10;
    }
  } else if (keyCode == DOWN && keyPressed) {
    if (rightPaddleY < 400) {
      rightPaddleY+=10;
    }
  }
  if (key == 'W' || key == 'w' && keyPressed) {
    if (leftPaddleY > 0) {
      leftPaddleY-=10;
    }
  } else if (key == 'S' || key == 's' && keyPressed) {
    if (leftPaddleY < 400) {
      leftPaddleY+=10;
    }
  }
  rect(20, leftPaddleY, 30, 100);
  rect(450, rightPaddleY, 30, 100);
  circle(circleX, circleY, 30);
  circleY+=speedY;
  circleX+=speedX;
  if (ballHittingLeft(leftPaddleY, circleY, circleX)) {
    println("Left Bumper");
    isHittingLeft = true;
  } else {
    isHittingLeft = false;
  }
  if (ballHittingRight(rightPaddleY, circleY, circleX)) {
    println("Right Bumper");
    isHittingRight = true;
  } else {
    isHittingRight = false;
  }
  if (circleY < 15 || circleY > 485) {
    speedY = -1*speedY;
  }
  if (isHittingLeft || isHittingRight) {
    speedX = -1*speedX;
  }
  if (circleX > 500) {
    scoreLeft++;
    circleX = 250;
    circleY = 250;
    pickSpeed();
    speedX = speedXY[0];
    speedY = speedXY[1];
  }
  if (circleX < 0) {
    scoreRight++;
    circleX = 250;
    circleY = 250;
    pickSpeed();
    speedX = speedXY[0];
    speedY = speedXY[1];
  }
  textSize(48);
  text(scoreRight, 350, 75);
  text(scoreLeft, 150, 75);
}
