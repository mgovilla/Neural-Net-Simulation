Obstacle obstacles[] = new Obstacle[3];
Goal goal = new Goal();
Robot robot = new Robot();

float radius = 50;

// Setup the Processing Canvas
void setup(){
  size(3000, 1500);
  strokeWeight(2);
  frameRate(30);
  
  for(int i = 0; i < 3; i++) {
    obstacles[i] = new Obstacle();
    obstacles[i].X = random(width); 
    obstacles[i].Y = random(height);
    obstacles[i].sideLen = radius;
  }
  
  goal.X = random(width);
  goal.Y = random(height);
  
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
  for(int i = 0; i < 3; i++) {
    
    obstacles[i].draw();
    
  }
  
  goal.draw();
  
  robot.draw();
                  
}

void keyPressed() {
  robot.keyPressed();
}
