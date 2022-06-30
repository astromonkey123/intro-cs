boolean[][] rpsChoice = new boolean[3][2];  // Rock-0 Paper-1 Scissors-2 | Comp-0 Player-1
int randomNum;

void mousePressed() {
  if (mouseX > 40 && mouseX < 460) {
    if (mouseY > 20 && mouseY < 80) {
      rpsChoice[0][1] = true;
      print("Rock");
    } else if (mouseY > 120 && mouseY < 180) {
      rpsChoice[1][1] = true;
      print("Paper");
    } else if (mouseY > 220 && mouseY < 280) {
      rpsChoice[2][1] = true;
      print("Scissors");
    }
  }
  randomNum = int(random(0, 3));
  print(randomNum);
  rpsChoice[randomNum][0] = true;
  for (int i = 0; i > rpsChoice.length; i++) {
    for (int j = 0; j > rpsChoice[i].length; j++) {
      if (rpsChoice[i][j]) {
        print(i + " " + j);
      }
    }
  }
}

void setup() {
  size(500, 300);
  background(0);
  fill(255);
  rect(40, 20, 420, 60);
  rect(40, 120, 420, 60);
  rect(40, 220, 420, 60);
  fill(0);
  textAlign(CENTER);
  textSize(48);
  text("Rock", 240, 65);
  text("Paper", 240, 165);
  text("Scissors", 240, 265);
}

void draw() {
}
