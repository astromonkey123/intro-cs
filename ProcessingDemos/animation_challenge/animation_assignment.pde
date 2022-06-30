float colorR = 0;
float triLength = 0;
float squareD = 0;
float squareY = 0;

void setup() {
  size(500, 500);
  noStroke();
  background(0);
}

void draw() {
  background(0);
  fill(colorR, colorR-284, colorR-268);
  circle(250, 250, 200);
  if (colorR < 233) {
    colorR += 0.5;
  }
  fill(255);
  triangle(0, 0, 0, 100, 115+triLength, 50);
  triLength++;
  stroke(0);
  square(0, 0, 200-squareD);
  squareD+=2;
  square(300, squareY, 30);
  squareY+=1.25;
  if (squareY > 500) {
    squareY=0;
  }
}
