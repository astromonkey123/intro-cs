float r = 255;
float g = 232;
float b = 23;

void buildingType1 (boolean hasRoof, float x, float y, float w, float h) {
  noStroke();
  quad(x-w/2, y, x+w/2, y, (x+w/2)-w/4, y-h, (x-w/2)+w/4, y-h);
  if (hasRoof) {
    arc(x, y-h, w/2, w/2, radians(180), radians(360));
    triangle(x+10, y-h-(w/6), x-10, y-h-(w/6), x, y-h-100);
  }
}


void buildingType2 (boolean hasRoof, float x, float y, float w, float h) {
  noStroke();
  rect(x-(w/2), y-h, w, h);
  if (hasRoof) {
    triangle(x-(w/2), y-h, x+(w/2), y-h, x, y-h-(w/2));
  }
}

void drawBackground() {
  for (int i = 0; i < height; i++ ) {
    r = map(i, 0, height, 237, 237);
    g = map(i, 0, height, 116, 131);
    b = map(i, 0, height, 130, 85);
    stroke(r, g, b);
    line(0, i, width, i);
  }
}

void setup() {
  size(1000, 500);
}

void draw() {
  drawBackground();
  fill(10);
  buildingType1(true, 50, 500, 100, 200);
  buildingType2(false, 150, 500, 100, 150);
  buildingType2(true, 225, 500, 50, 100);
  buildingType1(false, 275, 500, 50, 150);
  buildingType2(true, 350, 500, 100, 200);
  buildingType1(false, 450, 500, 100, 200);
  buildingType2(false, 525, 500, 50, 150);
  buildingType1(false, 625, 500, 150, 100);
  buildingType2(false, 750, 500, 100, 100);
  buildingType1(true, 900, 500, 200, 300);
}
