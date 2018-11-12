class Obstacle {
  float X, Y, Xvel, Yvel; 
  float sideLen; 
  
  Obstacle() {
    
  }
  
  void draw() {
     
    rect(X, Y, sideLen, sideLen);
    
    X += 200*cos(frameCount);
    Y += 200*sin(frameCount);
    
  }
}
