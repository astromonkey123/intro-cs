boolean isAlive = true;
float pac_x = 15;
float pac_y = 15;
float pac_dx = 0;
float pac_dy = 0;
float[][] ghostXY = {{250, 100, 400}, {250, 100, 400}};
int[] ghostType = {0, 1, 2};
String direction = "none";
boolean animationSwitch = true;
int animationStatus = 0;

void drawBackground() {
  background(0);
}

void drawPacman(float x, float y, String direction) {
  fill(255, 251, 83);
  if (direction == "up") {
    pac_dy = -1;
    pac_dx = 0;
    if (animationStatus >= 0) {
      arc(x, y, 30, 30, radians(300), radians(600), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 30, 30, radians(320), radians(580), PIE);
    }
  } else if (direction == "down") {
    pac_dy = 1;
    pac_dx = 0;
    if (animationStatus >= 0) {
      arc(x, y, 30, 30, radians(120), radians(420), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 30, 30, radians(140), radians(400), PIE);
    }
  } else if (direction == "left") {
    pac_dx = -1;
    pac_dy = 0;
    if (animationStatus >= 0) {
      arc(x, y, 30, 30, radians(210), radians(510), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 30, 30, radians(230), radians(490), PIE);
    }
  } else if (direction == "right") {
    pac_dx = 1;
    pac_dy = 0;
    if (animationStatus >= 0) {
      arc(x, y, 30, 30, radians(30), radians(330), PIE);
    } else if (animationStatus < 0) {
      arc(x, y, 30, 30, radians(50), radians(310), PIE);
    }
  } else if (direction == "none") {
    circle(x, y, 30);
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


void setup() {
  size(500, 500);
}

void draw() {
  drawBackground();
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
  } else if (pac_y >= 485) {
    direction = "up";
  }
  if (pac_x <= 15) {
    direction = "right";
  } else if (pac_x >= 485) {
    direction = "left";
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
