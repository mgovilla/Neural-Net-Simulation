class Robot {
  float[] decision;
  PVector pos, vel, temp;
  
  NeuralNet brain; 
  ArrayList<PVector> obsPositions;     //all the positions of the tail of the snake
  
  Matrix reward       = new Matrix(1, 1);
  
  float[] vision      = new float[10]; //5 directions, looking for obstacles/wall and the goal
  
  boolean alive       = true, 
          test        = false,
          win         = false;
  
  int     lifetime    = 0, 
          timeLeft    = 100; 
  
  
  float   angle       = 0, 
          deltaAngle  = PI/16;
          
  
                //---------------------------------------------------------------------------------------------------------------------------------------------------------\\ 

  //constructor
  Robot() {
    
    pos = new PVector();
    vel = new PVector (10, 0);
    
  }
  
  
  
   
  void show() {
       
    fill(184, 121, 0);
  
    // Set stroke-color white
    stroke(255); 
    rectMode(CENTER);
    rect(pos.x, pos.y, 50, 50);
   
   
    lineAngle(pos.x, pos.y, angle, 200);
      
        
  }
   
 
  void setVelocity() {
    
  }
  
  void move(float trans, float ang) {
      
    pos.x -= trans*cos(ang);
    pos.y -= trans*sin(ang);
    
  
  }
  
  
  void kill() {
    alive = false;
  }
  
  void keyPressed() {
    
    switch(key) {
      case 'w' :
        move(-25, -angle);
        break;
      case 's' :
        move(25, -angle);
        break;
      case 'd' :
        angle -= deltaAngle;
        break;
      case 'a' :
        angle += deltaAngle;
        break;
        
      case 'i' :
        alive = false;
        break;
    }   
  }
  
  void lineAngle(float x, float y, float angle, float length) {
    line(x, y, x+cos(angle)*length, y-sin(angle)*length);
  }
  
  PVector angleToDirection(float angle) {
    PVector vector = new PVector (cos(angle), -sin(angle));
    return vector;
  }
  
  void look() {
    
      vision = new float[15];
      float[] tempValues;
      //look left
      //float[] tempValues = lookInDirection(angleToDirection(angle - PI/8));
      //vision[0] = tempValues[0];
      //vision[1] = tempValues[1];
      //vision[2] = tempValues[2];
      
      //tempValues = lookInDirection(angleToDirection(angle - PI/16));
      //vision[3] = tempValues[0];
      //vision[4] = tempValues[1];
      //vision[5] = tempValues[2];
      
      //look up
      tempValues = lookInDirection(angleToDirection(angle));
      vision[6] = tempValues[0];
      vision[7] = tempValues[1];
      vision[8] = tempValues[2];
      
      ////look up/right
      //tempValues = lookInDirection(angleToDirection(angle + PI/16));
      //vision[9] = tempValues[0];
      //vision[10] = tempValues[1];
      //vision[11] = tempValues[2];
      
  
      //tempValues = lookInDirection(angleToDirection(angle + PI/8));
      //vision[12] = tempValues[0];
      //vision[13] = tempValues[1];
      //vision[14] = tempValues[2];
     
      printArray(tempValues);
    
  } 
  
  float[] lookInDirection(PVector direction) {
    //set up a temp array to hold the values that are going to be passed to the main vision array
    float[] visionInDirection = new float[3];
    
    PVector position = new PVector(pos.x, pos.y);//the position where we are currently looking for food or tail or wall
    
    
    boolean goalDetected = false;//true if the food has been located in the direction looked
    boolean obsDetected = false;//true if the tail has been located in the direction looked 
    float distance = 0.0;
    //move once in the desired direction before starting 
    position.add(direction);
    distance += 1.0;

    //look in the direction until you reach a wall
    
    while (!(position.x > width || position.y < 0 || position.x < 0 || position.y > height)) {

      //check for goal at the position
      if (!goalDetected && isOnGoal(position)) {
        visionInDirection[0] = distance(pos.x, pos.y, goal.pos.x, goal.pos.y);
        goalDetected = true; // dont check if food is already found
      }

      //check for obstacle at the position
      if (!obsDetected && isOnObs(position)) {
        visionInDirection[1] = distance;
        obsDetected = true; // dont check if tail is already found
      }

      //look further in the direction
      position.add(direction);
      distance +=1.0;
    }

    //set the distance to the wall
    visionInDirection[2] = distance;
    printArray(visionInDirection);
    return visionInDirection;
  }  
}
