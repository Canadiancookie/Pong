void paddleMovement() {
  if (leftPaddleUp == true ) {
    leftPaddleMoveY -= height/150;
  }
  if (leftPaddleDown == true) {
    leftPaddleMoveY += height/150;
  }
  if (leftPaddleMoveY <= 0 ) {
    leftPaddleMoveY = 0;
  }
  if (leftPaddleMoveY >= height-paddleHeight ) {
    leftPaddleMoveY = height-paddleHeight;
  }

  if (rightPaddleUp == true ) {
    rightPaddleMoveY -= height/150;
  }
  if (rightPaddleDown == true) {
    rightPaddleMoveY += height/150;
  }
  if (rightPaddleMoveY <= 0 ) {
    rightPaddleMoveY = 0;
  }
  if (rightPaddleMoveY >= height-paddleHeight ) {
    rightPaddleMoveY = height-paddleHeight;
  }
}
