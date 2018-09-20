class Population{
  Obstacles obstacles;
  Goal goal;
  Agent[] agents;
  
  Agent bestAgent;
  int bestStep = 400;
  
  float populationFitness;
  int generation = 1;
  
  // ----------------------- Setting up population --------------------
  Population(int size){
    agents = new Agent[size];
    populate();
  }
  
  void populate(){
    for (int i = 0; i < agents.length; i++){
      agents[i] = new Agent();
    }
  }
  
  void setObstacles(Obstacles obstacles){
    this.obstacles = obstacles;
    for (int i = 0 ; i < agents.length; i++){
      agents[i].obstacles = obstacles;
    }
  }
  
  void setGoal(Goal goal){
    this.goal = goal;
    for (int i = 0 ; i < agents.length; i++){
      agents[i].goal = goal;
    }
  }
  // --------------------- Performing genetic operations -------------------------------
  
  void update(){
    textSize(30);
    fill(0,0,0);
    
    text("Generation: " + generation,100,40);
    for (int i = 0; i < agents.length; i++){
      
      if (agents[i].controller.step > bestStep){ // Kill all bad agents
        agents[i].dead = true;
      }
      
      agents[i].spawn();
      agents[i].update();
    }
  }
  
  boolean extinct(){
    for (int i = 0; i < agents.length; i++){
      if (!agents[i].dead && !agents[i].goalReached){
        return false;
      }
    }
    return true;
  }
  
  void nextGeneration(){
    // Calculate the fitness of each agent
    for (int i = 0; i < agents.length; i++){
      agents[i].calculateFitness();
    }
    
    naturalSelection(); // Perform natural selection
    mutate();           // Slightly alter the population
    generation++;
  }
  
  void naturalSelection(){

    Agent[] nextGen = new Agent[agents.length];
    populationFitness = 0;
    
    // Calculate the total fitness of the population
    for (int i = 0; i < agents.length; i++){
      populationFitness += agents[i].fitness;
    }
    
    // Form the next generation
    setBestAgent();
    nextGen[0] = bestAgent.generateChild(); // Reserve the best agent
    nextGen[0].best = true;
    
    for (int i = 1; i < agents.length; i++){
      Agent parent = selectParent();
      nextGen[i] = parent.generateChild();
    }
    agents = nextGen.clone();
  }
  
  Agent selectParent(){
    float rand = random(populationFitness); // Random number between 0 and fitness.
    float sum = 0;
    
    for (int i = 0; i < agents.length; i++){
      sum += agents[i].fitness;
      
      // When the sum of the fitnesses becomes larger than the random number, select
      // the agent that pushed the sum higher than the random number. This means that agents
      // with high fitnesses have a larger chance as selected parents, while weak agents have a low
      // chance of selection. This keeps fit agents but also allows for diversity.
      if (sum > rand){ 
        return agents[i];
      }
    }
    
    return null; // Should never get here
  }
  
  void setBestAgent(){
    float bestFitness = 0;
    int bestIndex = 0;
    
    for (int i = 0; i < agents.length; i++){
      if (agents[i].fitness > bestFitness){
        bestFitness = agents[i].fitness;
        bestIndex = i;
      }
    }
    
    bestAgent = agents[bestIndex];
    
    if (bestAgent.goalReached){
      bestStep = bestAgent.controller.step;
    }
  }
  
  void mutate(){
    for (int i = 1; i < agents.length; i++){
      agents[i].controller.mutate();
    }
  }
}
