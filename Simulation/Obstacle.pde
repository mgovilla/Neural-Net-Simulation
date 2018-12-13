class Obstacle {
  PVector pos;
  float sideLen; 
  
  Obstacle() {
    pos = new PVector();
    
  }
  
  void show() {
     
    rect(pos.x, pos.y, sideLen, sideLen);
        
  }
  
  
}
