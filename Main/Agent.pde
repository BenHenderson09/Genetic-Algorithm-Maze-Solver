class Agent{
  AgentController controller;  
  Obstacles obstacles;
  Goal goal;
  
  PVector pos; // Position
  PVector vel; // Velocity
  PVector acc; // Acceleration
  
  boolean dead;
  boolean best;
  boolean goalReached;
  
  float fitness;
  
  Agent(){
    pos = new PVector(width/2, height-height/7);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    
    controller = new AgentController(400); // Make the controller with 400 paths
  }
  
  void spawn(){
    if (best){ // Make the best dot a different colour
      fill(0,0,255);
      ellipse(pos.x, pos.y, 25,25);
    }
    else{
      fill(255,255,255);
      ellipse(pos.x, pos.y, 10,10);
    }
  }
  
  void calculateFitness(){
    if(!goalReached){
      float distance = dist(pos.x,pos.y,goal.pos.x,goal.pos.y);
      fitness = 1.0/(distance*distance); // Inverse function to get fitness. Squared for larger impact.
    }
    else {
      fitness = 1000.0/(float)(controller.step*controller.step); // Inverse function to get fitness according to steps taken
    }
  }
  
  Agent generateChild(){
    Agent child = new Agent();
    child.controller = controller.clone();
    return child;
  }
  
  void move(){
    if (controller.step < controller.paths.length){
      acc = controller.paths[controller.step]; // Set the acceleration to the angle defined in the path variable
      controller.step++;
    }else{
      dead = true; // Die if the agent runs out of paths before reaching the goal
    }
    
   vel.limit(5); // Limit the velocity to five
   vel.add(acc); // Add the acceleration angle to the velocity
   pos.add(vel); // Change position to simulate movement
  }
  
  void update(){
    if (!dead && !goalReached){
      move();
     
      // Handle Collisions
      if (pos.x >= width || pos.x <= 0){ dead = true; }  // Wall collisions
      if (pos.y >= height || pos.y <= 0){ dead = true; } // Top and bottom collisions
      if (obstacles.touched(pos)){ dead = true; }        // Obstacle collisions
      
      // If the agent gets to the goal
      if (dist(pos.x,pos.y, goal.pos.x, goal.pos.y) < goal.size.x){ goalReached = true; }
    }
  }
}
