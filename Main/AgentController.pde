class AgentController{
  int step;
  PVector[] paths;
  
  AgentController(int size){
    paths = new PVector[size];
    setPaths();
  }
  
  void setPaths(){
    for (int i = 0; i < paths.length; i++){
      // Some fancy processing maths for getting a random angle
      float randomAngle = random(2*PI);
      paths[i] = PVector.fromAngle(randomAngle); 
    } 
  }
  
  AgentController clone(){
    // Make the child's controller the same as the parent's
    AgentController clone = new AgentController(paths.length);
    
    for (int i = 0; i < paths.length; i++){
      clone.paths[i] = paths[i].copy();
    }
    return clone;
  }
  
  void mutate(){
    float mutationRate = 0.01;
    
    // Mutation will alter the paths for different results to learn from,
    // there is a predifined chance (mutationRate), that a path wil be mutated.
    for (int i = 0; i < paths.length; i++){
      float rand = random(1); // Random value between 0 and 1
      
      if (rand <= mutationRate){
        // Set this direction randomly to mutate
        float randomAngle = random(2*PI);
        paths[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
}
