float r;
float g;
float b;

float mapCustom (float a, float s1, float e1, float s2, float e2) {
  float result;
  float range1 = e1-s1;
  float range2 = e2-s2;
  result = (a/range1)*range2;
  return result;
}
void setup() {
  size(500, 500);
}

void draw() {
  
  for (int i = 0; i < height; i++ ) {
    r = map(i, 0, height-1, 237, 237);
    g = map(i, 0, height-1, 116, 131);
    b = map(i, 0, height-1, 130, 85);
    stroke(r, g, b);
    line(0, i, width, i);
  }
}
