/*
 Ethan Rosenfeld
 06/29/2022
 Generative Art / Animation Project
 
 Challenges / Issues:
 - Troubleshooting the collision logic
 - Staying organized
 
 Future Possibilities:
 - Find ways to compress some areas of code
 - Add more balls
 - Add a system to count how many land in each section of the screen, and then calculate percentages
 - Display percentages to the top of the screen
 
 New Information:
 - Learned how to create semi-realistic interactions between objects on Processing
 - Used sensitive dependence on initial conditions to create new results each time the code is run
 
 Sources:
 - Collision detection code:
     - https://stackoverflow.com/questions/8566336/java-circle-circle-collision-detection
 */

float circle_x1 = 250;                    // Circle 1 X coordinate
float circle_y1 = 10;                     // Circle 1 Y coordinate
float speed_x1 = random(-0.3, 0.3);       // Circle 1 X speed (Randomized on start)
float speed_y1 = 4;                       // Circle 1 Y speed
float circle_x2 = 250;                    // Circle 2 X coordinate
float circle_y2 = 10;                     // Circle 2 Y coordinate
float speed_x2 = random(-0.3, 0.3);       // Circle 2 X speed (Randomized on start)
float speed_y2 = 4;                       // Circle 2 Y speed
float circle_x3 = 250;                    // Circle 3 X coordinate
float circle_y3 = 10;                     // Circle 3 Y coordinate
float speed_x3 = random(-0.3, 0.3);       // Circle 3 X speed (Randomized on start)
float speed_y3 = 4;                       // Circle 3 Y speed
float[][] arrayColor = new float[3][2];   // Array for color of balls depending on side
boolean collision1C = false;              // Detection of collision for circle 1 on the center of a pin
boolean collision1L = false;              // Detection of collision for circle 1 on the left of a pin
boolean collision1R = false;              // Detection of collision for circle 1 on the right of a pin
boolean collision2C = false;              // Detection of collision for circle 2 on the center of a pin
boolean collision2L = false;              // Detection of collision for circle 2 on the left of a pin
boolean collision2R = false;              // Detection of collision for circle 2 on the right of a pin
boolean collision3C = false;              // Detection of collision for circle 3 on the center of a pin
boolean collision3L = false;              // Detection of collision for circle 3 on the left of a pin
boolean collision3R = false;              // Detection of collision for circle 3 on the right of a pin
int[] pinX = {250, 200, 300, 150, 250, 350, 400, 300, 200, 100, 50, 150, 250, 350, 450};    // Array of pin X coordinates
int[] pinY = {150, 200, 200, 250, 250, 250, 300, 300, 300, 300, 350, 350, 350, 350, 350};   // Array of pin Y coordinates
float coord_a = random(50, 450);          // Coordiantes for random shape in background
float coord_b = random(50, 450);
float coord_c = random(50, 450);
float coord_d = random(50, 450);
float coord_e = random(50, 450);
float coord_f = random(50, 450);
float coord_g = random(50, 450);
float coord_h = random(50, 450);
float coord_i = random(50, 450);
float backgroundStatic = random(100, 150);  // Random background color
boolean bounceAgain1 = true;                // Booleans to make balls bounce again if hitting bottom
boolean bounceAgain2 = true;
boolean bounceAgain3 = true;

// Random background color and design
void randomBackground() {
  background(backgroundStatic);
  noStroke();
  fill(124, 152, 255);
  quad(coord_a, coord_b, coord_b, coord_c, coord_c, coord_d, coord_d, coord_e);
  quad(coord_e, coord_f, coord_f, coord_g, coord_g, coord_h, coord_h, coord_i);
  for (int i = 0; i < 10; i ++) {
    fill(200);
    rect(247.5, 60*i, 5, 30);
  }
}

// Create Exit and Reset buttons with functionality
void drawButtons() {
  fill(200);
  textAlign(CENTER);
  textSize(48);
  rect(20, 20, 200, 100, 50);
  fill(124, 152, 255);
  text("Reset", 115, 85);
  fill(200);
  rect(280, 20, 200, 100, 50);
  fill(125, 152, 255);
  text("Exit", 375, 85);
  if (mousePressed && mouseY > 20 && mouseY < 120) {
    if (mouseX > 20 && mouseX < 220) {
      circle_x1 = 250;
      circle_y1 = 10;
      speed_x1 = random(-0.3, 0.3);
      speed_y1 = 4;
      circle_x2 = 250;
      circle_y2 = 10;
      speed_x2 = random(-0.3, 0.3);
      speed_y2 = 4;
      circle_x3 = 250;
      circle_y3 = 10;
      speed_x3 = random(-0.3, 0.3);
      speed_y3 = 4;
      bounceAgain1 = true;
      bounceAgain2 = true;
      bounceAgain3 = true;
      coord_a = random(50, 450);          // Coordiantes for random shape in background
      coord_b = random(50, 450);
      coord_c = random(50, 450);
      coord_d = random(50, 450);
      coord_e = random(50, 450);
      coord_f = random(50, 450);
      coord_g = random(50, 450);
      coord_h = random(50, 450);
      coord_i = random(50, 450);
    }
    if (mouseX > 280 && mouseX < 480) {
      exit();
    }
  }
}

void setup() {
  size(500, 500);

  // Randomize color for left and right sides on start
  arrayColor[0][0] = random(150, 255);
  arrayColor[1][0] = 0;
  arrayColor[2][0] = random(150, 255);
  arrayColor[0][1] = 0;
  arrayColor[1][1] = random(150, 255);
  arrayColor[2][1] = random(150, 255);
}

void draw() {
  randomBackground();
  drawButtons();

  // Pins
  stroke(0);
  strokeWeight(2);
  fill(0);
  circle(250, 150, 10);
  circle(200, 200, 10);
  circle(300, 200, 10);
  circle(150, 250, 10);
  circle(250, 250, 10);
  circle(350, 250, 10);
  circle(400, 300, 10);
  circle(300, 300, 10);
  circle(200, 300, 10);
  circle(100, 300, 10);
  circle(50, 350, 10);
  circle(150, 350, 10);
  circle(250, 350, 10);
  circle(350, 350, 10);
  circle(450, 350, 10);

  // Choose fill color depending on side of screen and make ball
  stroke(0);
  if (circle_x1 > 250) {
    fill(arrayColor[0][0], arrayColor[1][0], arrayColor[2][0]);
  } else {
    fill(arrayColor[0][1], arrayColor[1][1], arrayColor[2][1]);
  }
  circle(circle_x1, circle_y1, 20);
  if (circle_x2 > 250) {
    fill(arrayColor[0][0], arrayColor[1][0], arrayColor[2][0]);
  } else {
    fill(arrayColor[0][1], arrayColor[1][1], arrayColor[2][1]);
  }
  circle(circle_x2, circle_y2, 20);
  if (circle_x3 > 250) {
    fill(arrayColor[0][0], arrayColor[1][0], arrayColor[2][0]);
  } else {
    fill(arrayColor[0][1], arrayColor[1][1], arrayColor[2][1]);
  }
  circle(circle_x3, circle_y3, 20);
  stroke(150, 200, 0);
  strokeWeight(2);

  // Detect collisions between ball and pins
  for (int i = 0; i < pinX.length; i ++) {
    float xDif1 = pinX[i] - circle_x1;                        // Calculation for collision for circle 1
    float yDif1 = pinY[i] - circle_y1;                            //https://stackoverflow.com/questions/8566336/java-circle-circle-collision-detection
    float distanceSquared1 = xDif1 * xDif1 + yDif1 * yDif1;
    if (distanceSquared1 < (5 + 7.5) * (5 + 7.5)) {
      if (circle_x1 > pinX[i]) {                              // Checking if collison is center, left, or right
        collision1R = true;
      } else if (circle_x1 < pinX[i]) {
        collision1L = true;
      } else {
        collision1C = true;
      }
    }
    float xDif2 = pinX[i] - circle_x2;                        // Calculation for collision for circle 2
    float yDif2 = pinY[i] - circle_y2;                            //https://stackoverflow.com/questions/8566336/java-circle-circle-collision-detection
    float distanceSquared2 = xDif2 * xDif2 + yDif2 * yDif2;
    if (distanceSquared2 < (5 + 7.5) * (5 + 7.5)) {
      if (circle_x2 > pinX[i]) {                              // Checking if collision is center, left, or right
        collision2R = true;
      } else if (circle_x2 < pinX[i]) {
        collision2L = true;
      } else {
        collision2C = true;
      }
    }
    float xDif3 = pinX[i] - circle_x3;                        // Calculation for collision for circle 1
    float yDif3 = pinY[i] - circle_y3;                            //https://stackoverflow.com/questions/8566336/java-circle-circle-collision-detection
    float distanceSquared3 = xDif3 * xDif3 + yDif3 * yDif3;
    if (distanceSquared3 < (5 + 7.5) * (5 + 7.5)) {
      if (circle_x3 > pinX[i]) {                              // Checking if collison is center, left, or right
        collision3R = true;
      } else if (circle_x3 < pinX[i]) {
        collision3L = true;
      } else {
        collision3C = true;
      }
    }
  }

  // Change ball movement depending on what side of the pin the ball hits if collision is detected
  // Collision direction for circle 1
  if (collision1C) {
    speed_y1 = -1;
    // println("Collision 1 Center");        // Dev check for correct collision detection
    speed_x1 = 0;
    collision1C = false;
  } else if (collision1L) {
    speed_y1 = -1;
    // println("Collision 1 Left");          // Dev check for correct collision detection
    speed_x1 = abs(speed_x1) * -1.25;
    collision1L = false;
  } else if (collision1R) {
    speed_y1 = -1;
    // println("Collision 1 Right");         // Dev check for correct collision detection
    speed_x1 = abs(speed_x1) * 1.25;
    collision1R = false;
  }

  // Collision direction for circle 2
  if (collision2C) {
    speed_y2 = -1;
    // println("Collision 2 Center");        // Dev check for correct collision detection
    speed_x2 = 0;
    collision2C = false;
  } else if (collision2L) {
    speed_y2 = -1;
    // println("Collision 2 Left");          // Dev check for correct collision detection
    speed_x2 = abs(speed_x2) * -1.25;
    collision2L = false;
  } else if (collision2R) {
    speed_y2 = -1;
    // println("Collision 2 Right");         // Dev check for correct collision detection
    speed_x2 = abs(speed_x2) * 1.25;
    collision2R = false;
  }

  // Collision direction for circle 3
  if (collision3C) {
    speed_y3 = -1;
    // println("Collision 2 Center");        // Dev check for correct collision detection
    speed_x3 = 0;
    collision3C = false;
  } else if (collision3L) {
    speed_y3 = -1;
    // println("Collision 2 Left");          // Dev check for correct collision detection
    speed_x3 = abs(speed_x3) * -1.25;
    collision3L = false;
  } else if (collision3R) {
    speed_y3 = -1;
    // println("Collision 2 Right");         // Dev check for correct collision detection
    speed_x3 = abs(speed_x3) * 1.25;
    collision3R = false;
  }

  // If at the bottom, bounce once then stop moving
  if (circle_y1 >= 485) {
    if (speed_x1 > 0.2) {
      speed_x1 -= 0.2;
    } else if (speed_x1 < -0.2) {
      speed_x1 += 0.2;
    } else {
      speed_x1 = 0;
    }
    if (bounceAgain1) {
      speed_y1 = -2;
      bounceAgain1 = false;
    } else if (!bounceAgain1 && circle_y1 >= 484) {
      speed_y1 = 0;
    }
  }
  if (circle_y2 >= 485) {
    if (speed_x2 > 0.2) {
      speed_x2 -= 0.2;
    } else if (speed_x2 < -0.2) {
      speed_x2 += 0.2;
    } else {
      speed_x2 = 0;
    }
    if (bounceAgain2) {
      speed_y2 = -2;
      bounceAgain2 = false;
    } else if (!bounceAgain2 && circle_y2 >= 484) {
      speed_y2 = 0;
    }
  }
  if (circle_y3 >= 485) {
    if (speed_x3 > 0.2) {
      speed_x3 -= 0.2;
    } else if (speed_x3 < -0.2) {
      speed_x3 += 0.2;
    } else {
      speed_x3 = 0;
    }
    if (bounceAgain3) {
      speed_y3 = -2;
      bounceAgain3 = false;
    } else if (!bounceAgain3 && circle_y3 >= 484) {
      speed_y3 = 0;
    }
  }

  // If touching walls, bounce back
  if (circle_x1 >= 490 || circle_x1 <= 10) {
    speed_x1 *= -1;
  }
  if (circle_x2 >= 490 || circle_x2 <= 10) {
    speed_x2 *= -1;
  }
  if (circle_x3 >= 490 || circle_x3 <= 10) {
    speed_x3 *= -1;
  }

  // Constant speed calculations
  circle_y1+=speed_y1;
  circle_x1+=speed_x1;
  speed_y1+=0.02;
  circle_y2+=speed_y2;
  circle_x2+=speed_x2;
  speed_y2+=0.06;
  circle_y3+=speed_y3;
  circle_x3+=speed_x3;
  speed_y3+=0.04;
}

/*
Peer Review:
 
 Sebastian
 - Make the balls Rick Astley's head
     - I'm not doing this one
 - Make the ball bounce one more time when it hits the ground
     - Completed, but breaks often
 
 Maxwell
 - Change blue shape on reset
     - Completed
 - Change apparent weight of balls
     - Completed 
 - Change middle line X position as the balls fall -- affects color of balls
     - Not possible the way the code is currently set up
 - Randomize background shape color
     - I decided not to do this
 */
