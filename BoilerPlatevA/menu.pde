void menu() {
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, width/6.5, height/1.725);
  fill(0);
  rect(width/2, height*27.5/100, width/8, height/13);
  rect(width/2, height*38.75/100, width/8, height/13);
  //rect(width/2, height*50/100, width/8, height/13);
  rect(width/2.15, height*50/100, width/18, height/13);
  rect(width/1.87, height*50/100, width/18, height/13);
  rect(width/2.15, height*61.25/100, width/18, height/13);
  rect(width/1.87, height*61.25/100, width/18, height/13);
  rect(width/2, height*72.5/100, width/8, height/13);

  textAlign(CENTER, CENTER);
  fill(255);
  textSize(width*3/100);
  text("Resume", width/2, height*27/100);
  text("Reset", width/2, height*38.25/100);

  textSize(width*1.7/100);
  text("Ball", width/2.15, height*47.5/100);
  text("Speed", width/2.15, height*49.5/100);
  text("Ball", width/1.87, height*47.5/100);
  text("Speed", width/1.87, height*49.5/100);
  textSize(width*2/100);
  text("+", width/2.15, height*51.5/100);
  text("-", width/1.87, height*51.5/100);
  textSize(width*1.1/100);
  fill(0);
  textSize(width*1.7/100);
  if (speedX >= 0) {
    text("Ball Speed: " + speedX, width/2, height*55.27/100);
  }
  if (speedX < 0) {
    text("Ball Speed: " + speedX * -1, width/2, height*55.27/100);
  }

  fill(255);
  textSize(width*2/100);
  text("Light", width/2.15, height*61/100);
  text("Dark", width/1.87, height*61/100);

  textSize(width*2.4/100);
  text("Exit Game", width/2, height*72/100);
  rectMode(CORNER);
}

void mousePressed() {

  if (menuOpen == true) {
    //resume
    if (mouseX > width/2.29 && mouseX < width/1.775 && mouseY > height/4.3 && mouseY < height/3.2) {
      menuOpen = false;
    }

    //reset
    if (mouseX > width/2.29 && mouseX < width/1.775 && mouseY > height/2.88 && mouseY < height/2.34) {
      ballMoveX = width/2;
      ballMoveY = height/2;
      speedX = 5;
      speedY = 5;
      leftPoints = 0;
      rightPoints = 0;
      leftPaddleMoveY = paddleStartPos;
      rightPaddleMoveY = paddleStartPos;
    }

    //ball speed + button
    //X and Y positive
    if (mouseX > width/2.29 && mouseX < width/2.025 && mouseY > height/2.18 && mouseY < height/1.86 && speedX >= 0 && speedY >= 0) {
      speedX = speedX +1;
      speedY = speedY +1;
    }
    //X and Y negative
    if (mouseX > width/2.29 && mouseX < width/2.025 && mouseY > height/2.18 && mouseY < height/1.86 && speedX < 0 && speedY < 0) {
      speedX = speedX -1;
      speedY = speedY -1;
    }
    //X positive and Y negative
    if (mouseX > width/2.29 && mouseX < width/2.025 && mouseY > height/2.18 && mouseY < height/1.86 && speedX >= 0 && speedY < 0) {
      speedX = speedX +1;
      speedY = speedY -1;
    }
    //X negative and Y positive
    if (mouseX > width/2.29 && mouseX < width/2.025 && mouseY > height/2.18 && mouseY < height/1.86 && speedX < 0 && speedY >= 0) {
      speedX = speedX -1;
      speedY = speedY +1;
    }
    
    //ball speed - button
    //X and Y positive
    if (mouseX > width/1.975 && mouseX < width/1.775 && mouseY > height/2.18 && mouseY < height/1.86 && speedX >= 0 && speedY >= 0) {
      speedX = speedX -1;
      speedY = speedY -1;
    }
    //X and Y negative
    if (mouseX > width/1.975 && mouseX < width/1.775 && mouseY > height/2.18 && mouseY < height/1.86 && speedX < 0 && speedY < 0) {
      speedX = speedX +1;
      speedY = speedY +1;
    }
    //X positive and Y negative
    if (mouseX > width/1.975 && mouseX < width/1.775 && mouseY > height/2.18 && mouseY < height/1.86 && speedX >= 0 && speedY < 0) {
      speedX = speedX -1;
      speedY = speedY +1;
    }
    //X negative and Y positive
    if (mouseX > width/1.975 && mouseX < width/1.775 && mouseY > height/2.18 && mouseY < height/1.86 && speedX < 0 && speedY >= 0) {
      speedX = speedX +1;
      speedY = speedY -1;
    }

    //light/dark
    if (mouseX > width/2.29 && mouseX < width/2.025 && mouseY > height/1.745 && mouseY < height/1.53) {
      lightMode = true;
      darkMode = false;
    }
    if (mouseX > width/1.975 && mouseX < width/1.775 && mouseY > height/1.745 && mouseY < height/1.53) {
      lightMode = false;
      darkMode = true;
    }

    //exit game
    if (mouseX > width/2.29 && mouseX < width/1.775 && mouseY > height/1.46 && mouseY < height/1.31) {
      exit();
    }
  }
}
