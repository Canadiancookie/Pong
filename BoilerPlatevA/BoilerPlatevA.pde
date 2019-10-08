/*
  _____                      __               _____  _____ ____   ___  
 |  __ \                    / _|             / ____|/ ____|___ \ / _ \ 
 | |__) |__  _ __   __ _   | |_ ___  _ __   | |    | (___   __) | | | |
 |  ___/ _ \| '_ \ / _` |  |  _/ _ \| '__|  | |     \___ \ |__ <| | | |
 | |  | (_) | | | | (_| |  | || (_) | |     | |____ ____) |___) | |_| |
 |_|   \___/|_| |_|\__, |  |_| \___/|_|      \_____|_____/|____/ \___/ 
                    __/ |                                              
                   |___/            
                   
************************************************************************

 __   __       ___  __   __        __   
/  ` /  \ |\ |  |  |__) /  \ |    /__` .
\__, \__/ | \|  |  |  \ \__/ |___ .__/ .  

 ____ 
||M ||
||__|| - Open Menu
|/__\|
 ____ ____ 
||W |||S ||
||__|||__|| - Move left paddle up/down
|/__\|/__\|
 ____ ____ 
||↑ |||↓ ||
||__|||__|| - Move right paddle up/down
|/__\|/__\|

*/

//Global Variables
float ballStartPositionX; // displayWidth
float ballStartPositionY; // displayHeight
float ballSize; // displayWidth

float paddleStartPos; 
float paddleWidth;
float paddleHeight;

float leftPaddleMoveX;
float leftPaddleMoveY;

float rightPaddleMoveX;
float rightPaddleMoveY;

int ballMoveX; //Declare
int ballMoveY; //Declare
int speedX = 5; 
int speedY = 5;
int leftPoints = 0;
int rightPoints = 0;

boolean lightMode = true;
boolean darkMode = false;
boolean menuOpen = false;

boolean leftPaddleUp = false;
boolean leftPaddleDown = false;

boolean rightPaddleUp = false;
boolean rightPaddleDown = false;


void setup () {
  fullScreen();
  //size(800,600);
  GUI_Setup();
}

void draw () {
  //background
  if (lightMode == true) {
    fill(200);
    rect(-1, -1, width+1, height+1);
  }

  if (darkMode == true) {
    fill(50);
    rect(-1, -1, width+1, height+1);
  }

  //ball movement
  if (ballMoveX >= width-ballSize/2 || ballMoveX <= 0-ballSize/2 && menuOpen == false) {
    speedX = speedX * -1;
  }
  if (ballMoveY >= height-ballSize/2 || ballMoveY <= 0-ballSize/2 && menuOpen == false) {
    speedY = speedY * -1;
  }

  //stop ball while in menu
  if (menuOpen == false) {
    ballMoveX += speedX; // Progression of ballMoveX+1 to ballMoveX+1 to...
    ballMoveY += speedY; //What is the difference in these lines
  }

  println ("X Move:", ballMoveX);
  println ("Y Move:", ballMoveY);

  paddleMovement();

  //ball draw
  fill(#00ff11); //neon green
  ellipse (ballMoveX, ballMoveY, ballSize, ballSize);

  //paddle draw
  fill(#FF0D00); //red
  rect(leftPaddleMoveX, leftPaddleMoveY, paddleWidth, paddleHeight);
  fill(#000AFF); //blue
  rect(rightPaddleMoveX, rightPaddleMoveY, paddleWidth, paddleHeight);

  //score text
  textSize(120);
  textAlign(CENTER);
  fill(#FF0D00);  
  text(leftPoints, width/4, height/6);
  fill(#000AFF);
  text(rightPoints, width/4*3, height/6);

  //scoring when ball hits left/right of screen
  if (ballMoveX <= 0) {
    ballMoveX = width/2;
    ballMoveY = height/2;
    leftPoints = leftPoints + 1;
  }
  if (ballMoveX >= width-ballSize/2) {
    ballMoveX = width/2;
    ballMoveY = height/2;
    rightPoints = rightPoints + 1;
  }


  //bounce

  if (ballMoveX > width/18.3 && ballMoveX < width/1.057) {
    if (ballMoveX <= leftPaddleMoveX+paddleWidth+ballSize/2) {
      if (ballMoveY >= leftPaddleMoveY && ballMoveY <= leftPaddleMoveY+paddleHeight) {
        speedX = speedX * -1;
      }
    }
    if (ballMoveX >= rightPaddleMoveX-ballSize/2) {
      if (ballMoveY >= rightPaddleMoveY && ballMoveY <= rightPaddleMoveY+paddleHeight) {
        speedX = speedX * -1;
      }
    }
  }

  if (menuOpen == true) {
    menu();
  }
}

void keyPressed() {
  if (key == 'W' || key == 'w' && menuOpen == false) {
    leftPaddleUp = true; //Codes continuous action
    leftPaddleDown = false;
  }
  if (key == 'S' || key == 's' && menuOpen == false) {
    leftPaddleUp = false;
    leftPaddleDown = true; //Codes continuous action
  }

  if (key == CODED && keyCode == UP && menuOpen == false) {
    rightPaddleUp = true; //Codes continuous action
    rightPaddleDown = false; //Only one action at a time
  }
  if (key == CODED && keyCode == DOWN && menuOpen == false) {
    rightPaddleUp = false;
    rightPaddleDown = true; //Codes continuous action
  }

  //lightmode/darkmode toggle
  if (key == '1' || key == '!') {
    lightMode = true;
    darkMode = false;
  }

  if (key == '2' || key == '@') {
    lightMode = false;
    darkMode = true;
  }

  if (key == 'm' || key == 'M' && menuOpen == false) {
    menuOpen = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    leftPaddleUp = false;
    leftPaddleDown = false;
  }
  if (key == 's' || key == 'S') {
    leftPaddleUp = false;
    leftPaddleDown = false;
  }

  if (key == CODED && keyCode == UP) {
    rightPaddleUp = false;
    rightPaddleDown = false;
  }
  if (key == CODED && keyCode == DOWN) {
    rightPaddleUp = false;
    rightPaddleDown = false;
  }

  if (key == 'p' || key == 'P') {
    exit();
  }
}
