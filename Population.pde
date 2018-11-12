class Population {
  
  Robot[] robots;
  
  Population(int size) {
    robots = new Robot[size];
    //initiate all the snakes
    for (int i =0; i<robots.length; i++) {
      robots[i] = new Robot();
    }
    
  }
 
}
