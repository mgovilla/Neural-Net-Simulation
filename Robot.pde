class Robot {
    
  float[] vision = new float[10]; //5 directions, looking for obstacles/wall and the goal
  float X,Y, Xvel, Yvel; 
  
  NeuralNet Brain; 
  
  int lifetime = 200; 
  
                //---------------------------------------------------------------------------------------------------------------------------------------------------------\\ 

  //constructor
  Robot() {
    
  }
  
  void setup() {
    X = random(width);
    Y = random(height);
    
    
  }
  
  void draw() {
    X += Xvel;
    Y += Yvel;
    
    fill(184, 121, 0);
  
    // Set stroke-color white
    stroke(255); 
    rect(X, Y, 50, 50);
    
  }
  
  void keyPressed() {
       
    if(key == 'w') {
        Xvel = 0;
        Yvel = -15;
    }
    
    if(key == 's') {
        Xvel = 0;
        Yvel = 15;
    }
    
    if(key == 'a') {
        Xvel = -15;
        Yvel = 0;
    }
    
    if(key == 'd') {
        Xvel = 15;
        Yvel = 0;
    }
    
  }
  
  void setVelocity() {
    
  }
  
  void move() {
    
  }
  
  void spin() {
    
  
  }
  
  void kill() {
    
    
  }
    
}
