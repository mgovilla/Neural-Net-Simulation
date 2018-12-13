int OBSNUM = 3;

Obstacle obstacles[] = new Obstacle[OBSNUM];
Goal goal = new Goal();
Robot robot = new Robot();
float radius = 200;
ArrayList<PVector> obsPositions = new ArrayList<PVector>();

PVector temp;

// Setup the Processing Canvas
void setup(){
  size(3000, 1500);
  strokeWeight(2);
  frameRate(30);
  ellipseMode(CENTER);
  rectMode(CENTER);
   
  
  
  for(int i = 0; i < OBSNUM; i++) {  
    obstacles[i] = new Obstacle();
    
    obstacles[i].pos.x = random(width-200); 
    obstacles[i].pos.y = random(height-200);
    obstacles[i].sideLen = radius;
    temp = new PVector(obstacles[i].pos.x, obstacles[i].pos.y);
    obsPositions.add(temp);
  }
  
   goal.pos.x = (int) random(100, width - 100);
   goal.pos.y = (int) random(100, height - 100); 
  
   robot.pos.x = (int) random(width);
   robot.pos.y = (int) random(height);
   
  while(isOnObs(goal.pos) && isOnObs(robot.pos) && isOnGoal(robot.pos)) {
    goal.pos.x = (int) random(100, width - 100);
    goal.pos.y = (int) random(100, height - 100);  
    robot.pos.x = (int) random(width);
    robot.pos.y = (int) random(height);
  }
  
}

// Main draw loop
void draw() {
  
  // Fill canvas grey
  background(150);
  
  // Set fill-color to blue
  fill(0, 121, 184);
  // Set stroke-color white
  stroke(255); 
  
  // Draw 
  for(int i = 0; i < OBSNUM; i++) {
    
    temp = new PVector(obstacles[i].pos.x, obstacles[i].pos.y);
    obsPositions.set(i, temp);
        
    
    obstacles[i].show();
    
    //if(distance(robot.pos.x, robot.pos.y, obstacles[i].pos.x, obstacles[i].pos.y) < radius) {
    //  robot.alive = false;
    //  println("dead");
    //}
    
    if(isOnObs(robot.pos)) {
      robot.alive = false;
      println("dead");
    }
    
    if(robot.pos.x < 0 || robot.pos.y < 0 || robot.pos.x >= width || robot.pos.y >= height) {
      robot.alive = false;
      println("dead");
    }
    
  }
  
  
  if(isOnGoal(robot.pos)) {
    robot.win = true;
  }
  
  goal.show();
  
  if(robot.alive && !robot.win)
    robot.show();
    
  
  robot.look();
  
                  
}

void keyPressed() {
  robot.keyPressed();
}

float distance(float x1, float y1, float x2, float y2) {
  return sqrt(abs(pow(x2-x1, 2) + pow(y2-y1, 2)));
}

void calulateCost() {
  
  
}
boolean isOnObs(PVector pos) {
    for (int i = 0; i < OBSNUM; i++) {
      if (Math.abs(obstacles[i].pos.x - pos.x) < 127 && Math.abs(obstacles[i].pos.y - pos.y) < 127) {
        return true;
      }
    }
    
    return false;
  }
  
boolean isOnGoal(PVector pos) {
    
    return (Math.abs(goal.pos.x - pos.x) < 50 && Math.abs(goal.pos.y - pos.y) < 50);
    
}
  
    
