
// Game style
PVector WINDOW_SIZE = new PVector(1500, 800);
color BACKGROUND = color(8, 150, 161);

// Main components
Population population;
Obstacles obstacles;
Goal goal;

void settings(){
  size(int(WINDOW_SIZE.x), int(WINDOW_SIZE.y));
}

void setup(){
  population  = new Population(900);
  obstacles   = new Obstacles();
  goal        = new Goal();
  
  // Setup the obstacles
  obstacles.obstacleColour = color(0,255,0);
  generateObstacles();
  
  // Setup the goal
  goal.goalColour = color(255,0,0);
  goal.size = new PVector(20,20);
  goal.pos = new PVector(width/2, height/8);
  
  // Give the population the information
  population.setObstacles(obstacles);
  population.setGoal(goal);
}

void generateObstacles(){
  obstacles.generate(new float[] {width-width/2,height-height/2,500,10});
  obstacles.generate(new float[] {width-width/1.2,height-height/2.5,200,10});
  obstacles.generate(new float[] {width-width/1.5,height-height/1.5,200,10});
  obstacles.generate(new float[] {width-width/10,height-height/1.5,200,10});
  obstacles.generate(new float[] {width/10,height-height/1.5,200,10});
  obstacles.generate(new float[] {width/10,height/10,200,10});
  obstacles.generate(new float[] {width/10,height/1.3,200,10});
  obstacles.generate(new float[] {width-width/10,height/1.3,200,10});
  obstacles.generate(new float[] {width-width/1.5,height/1.3,400,10});
  obstacles.generate(new float[] {width/2.5, height/20,600,10});
  obstacles.generate(new float[] {width/1.5, height/6,250,10});
}

void draw(){
  background(BACKGROUND);
  obstacles.render();
  goal.render();
  population.update();
  
  // Genetic functions
  if (population.extinct()){
    population.nextGeneration();
    population.setObstacles(obstacles);
    population.setGoal(goal);
  }
}
