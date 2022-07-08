void checkGhostIntersection(float x, float y, boolean up, boolean down, boolean left, boolean right) {
  for (int i = 0; i < ghostXY[0].length; i++) {
    int x_dif = pac_x - ghostXY[0][i];
    int y_dif = pac_y - ghostXY[1][i];
      if (circleCircleCollisionCheck(pac_x, pac_y, 2, x, y, 2)) {
      isGhostOnIntersection[i] = true;
      ghostXY[0][i] = x;
      ghostXY[1][i] = y;
      allowedGhostUp[i] = up;
      allowedGhostDown[i] = down;
      allowedGhostLeft[i] = left;
      allowedGhostRight[i] = right;
      if (up) {
        if (y_dif > 0 && isGhostOnIntersection[i]) {
          ghostXY[1][i] = y-6;
          ghostDirection[i] = "up";
        }
      }
      if (down) {
        if (y_dif < 0 && isGhostOnIntersection[i]) {
          ghostXY[1][i]= y+6;
          ghostDirection[i] = "down";
        }
      }
      if (left) {
        if (x_dif > 0 && isGhostOnIntersection[i]) {
          ghostXY[0][i] = x-6;
          ghostDirection[i] = "left";
        }
      }
      if (right) {
        if (x_dif < 0 && isGhostOnIntersection[i]) {
          ghostXY[0][i] = x+6;
          ghostDirection[i] = "right";
        }
      }
    } else {
      isGhostOnIntersection[i] = false;
    }
  }
}

if (ghostDirection[i] == "up" && allowedUp) {
    ghost_dx[i] = 0;
    ghost_dy[i] = -1.25;
  } else if (ghostDirection[i] == "down" && allowedDown) {
    ghost_dx[i] = 0;
    ghost_dy[i] = 1.25;
  } else if (ghostDirection[i] == "left" && allowedLeft) {
    ghost_dx[i] = -1.25;
    ghost_dy[i] = 0;
  } else if (ghostDirection[i] == "right" && allowedRight) {
    ghost_dx[i] = 1.25;
    ghost_dy[i] = 0;
  } else if (ghostDirection[i] == "none") {
    ghost_dx[i] = 0;
    ghost_dy[i] = 0;
  }
}
