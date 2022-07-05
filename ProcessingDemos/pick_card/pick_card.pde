float[] cardY = {365, 315, 265, 315, 365};
float yMovement = 0;
int[] value = {int(random(1, 11)), int(random(1, 11)), int(random(1, 11)), int(random(1, 11)), int(random(1, 11))};
int[] suit = {int(random(1, 5)), int(random(1, 5)), int(random(1, 5)), int(random(1, 5)), int(random(1, 5))};
int[] variation = {int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3))};

void checkRedraw() {
  noStroke();
  textSize(40);
  fill(25, 50, 25);
  rect((width/2)+25, 95, 200, 100, 50);
  strokeWeight(5);
  stroke(0);
  fill(255);
  rectMode(CENTER);
  rect(width/2, 70, 200, 100, 50);
  fill(0);
  text("Redraw", (width/2)-65, 85);
  if (mousePressed && mouseX > 400 && mouseX < 600) {
    if (mouseY > 20 && mouseY < 120) {
      redraw = true;
      for (int i = 0; i < value.length; i++) {
        value[i] = int(random(1, 11));
      }
      for (int i = 0; i < variation.length; i++) {
        variation[i] = int(random(1, 3));
      }
      for (int i = 0; i < suit.length; i++) {
        suit[i] = int(random(1, 5));
      }
    }
  }
}

void drawCard(float x, float y, int value, int suit, int variation) {
  strokeWeight(5);
  fill(255);
  rectMode(CENTER);
  rect(x, y, 120, 200, 10);
  fill(0);
  strokeWeight(0);
  textSize(35);
  text(value, x-40, y-60);
  text(value, x+20, y+80);
  if (suit == 1) {
    if (variation == 1) {
      fill(0, 0, 255);
    } else {
      fill(0, 255, 0);
    }
    teardrop(x, y, 20);
  } else if (suit == 2) {
    if (variation == 1) {
      fill(255, 0, 0);
    } else {
      fill(255, 255, 0);
    }
    circle(x, y, 20);
  } else if (suit == 3) {
    if (variation == 1) {
      fill(255, 0, 0);
    } else {
      fill(255, 0, 255);
    }
    diamond(x, y, 20);
  } else if (suit == 4) {
    if (variation == 1) {
      fill(0);
    } else {
      fill(255);
    }
    square(x, y, 20);
  }
}

void teardrop(float x, float y, float w) {
  triangle(x-w/2, y, x, y-1.5*w, x+w/2, y);
  arc(x, y, w, w, radians(-3), radians(183), OPEN);
}

void diamond(float x, float y, float w) {
  push();
  translate(x, y);
  rotate(radians(45));
  square(0, 0, w);
  pop();
}

void setup() {
  size(1000, 500);
}

void draw() {
  background(50, 100, 50);
  checkRedraw();
  for (int i = 0; i < cardY.length; i++) {
    noStroke();
    fill(25, 50, 25);
    rect((i*200)+125, cardY[i]+25, 120, 200, 10);
    stroke(0);
    drawCard((i*200)+100, cardY[i], value[i], suit[i], variation[i]);
  }
  for (int i = 0; i < cardY.length; i++) {
    cardY[i] += sin(yMovement)/3;
  }
  yMovement += 0.1;
}
