void GUI_Setup() {

  paddleWidth = width/175;
  paddleHeight = height/8;
  paddleStartPos = (height/2)-(height/16);

  leftPaddleMoveX = width*5/100;
  leftPaddleMoveY = paddleStartPos;
  rightPaddleMoveX = width*94/100;
  rightPaddleMoveY = paddleStartPos;

  ballStartPositionX = width/2; // displayWidth
  ballStartPositionY = height/2; // displayHeight
  ballSize = width/100; // displayWidth
  ballMoveX = int (ballStartPositionX); //Populate, Example of Casting
  ballMoveY = int (ballStartPositionY); //Populate, Example of Casting
}
