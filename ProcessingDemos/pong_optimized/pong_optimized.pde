float circleX = 350;                       // Ball Y coordinate
float circleY = 350;                       // Ball X coordinate
float speedX = 0;                          // Ball speed in Y
float speedY = 0;                          // Ball speed in X
int scoreLeft = 0;                         // Score for left side
int scoreRight = 0;                        // Score for right side
float[] speedXY = new float[2];            // Array for X and Y speed on start
float rightPaddleY = 250;                  // Right paddle up/down movement
float leftPaddleY = 250;                   // Left paddle up/down movement
int bounceCount;
float speedYDirection;

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
    if (642.5 < ballX && ballX < 657.5) {
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
    randX+=3;
  } else if (randX < 0) {
    randX-=3;
  }
  speedXY[0] = randX;
  float randY = random(-1, 1);
  if (randY >= 0) {
    randY+=2;
  } else if (randY < 0) {
    randY-=2;
  }
  speedXY[1] = randY;
}

void setup() {
  size(700, 500);
  pickSpeed();
  speedX = speedXY[0];
  speedY = speedXY[1];
}

void draw() {
  background(0);
  fill(255);
  
  // Draw centerline
  for (int i = 0; i < 500; i+=50) {
    rect(345, i, 10, 25);
  }
  fill(255);
  
  // Check keys for movement of bumpers
  rightPaddleY = mouseY-50;
  float error = circleY-50-leftPaddleY;
  leftPaddleY+=(error/10);
  rect(30, leftPaddleY, 20, 100);
  rect(650, rightPaddleY, 20, 100);
  square(circleX-10, circleY-10, 20);
  circleY+=speedY;
  circleX+=speedX;

  // Ball bounces off top and bottom
  if (circleY < 10 || circleY > 490) {
    speedY = -1*speedY;
  }
  
  // Ball bounces off paddles
  if (ballHittingLeft(leftPaddleY, circleY, circleX) || ballHittingRight(rightPaddleY, circleY, circleX)) {
    speedX = -1*speedX;
    if (speedX < 0 && abs(speedX) < 17) {
      speedX-=0.5;
    } else if (abs(speedX) < 17) {
      speedX+=0.5;
    }
    if (speedY < 0 && abs(speedY) < 10) {
      speedY-=0.25;
    } else if (abs(speedY) < 17) {
      speedY+=0.25;
    speedYDirection = random(-1, 1);  // Create randomizer for Y speed
    }
    if (speedYDirection < 0) {
      speedY*=-1;
    }
    println(speedYDirection);
    println("Speed: " + speedX);
    bounceCount++;
    println("Count: " + bounceCount);
  }
  
  // Score detection and display
  if (circleX > 700) {
    scoreLeft++;
    circleX = 350;
    circleY = random(150, 350);
    pickSpeed();
    speedX = speedXY[0];
    speedY = speedXY[1];
  }
  if (circleX < 0) {
    scoreRight++;
    circleX = 350;
    circleY = random(150, 350);
    pickSpeed();
    speedX = speedXY[0];
    speedY = speedXY[1];
  }
  textSize(48);
  text(scoreRight, 450, 50);
  text(scoreLeft, 250, 50);
}
