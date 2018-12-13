class Goal {
  PVector pos;
  float radius = 50;
  
  Goal() {
    pos = new PVector();
    
  }
  
  void show() {
    fill(180, 0, 0);
    ellipse(pos.x, pos.y, radius, radius);
    
  }
  
  boolean isOnObs() {
    for (int i = 0; i < obstacles.length; i++) {
      if (Math.abs(obstacles[i].pos.x - goal.pos.x) < 127 && Math.abs(obstacles[i].pos.y - goal.pos.y) < 127) {
        return true;
      }
    }
 
    return false;
  }
  
  float xPos() {
    return pos.x;
  }
  
  float yPos() {
    return pos.y;
  }
}
