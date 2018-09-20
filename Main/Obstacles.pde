class Obstacles{
  ArrayList obstacles = new ArrayList();
  color obstacleColour;
  
  void generate(float[] obstacle){
    obstacles.add(obstacle);
  }
  
  void render(){
      for(int i = 0; i < obstacles.size(); i++){
        float[] obstacle = (float[])obstacles.get(i);
        fill(obstacleColour);
        rect(obstacle[0], obstacle[1], obstacle[2], obstacle[3]); // Draw each obstacle specified
      }
    }
    
   boolean touched(PVector pos){
     for(int i = 0; i < obstacles.size(); i++){
        float[] obstacle = (float[])obstacles.get(i);
        
        if (pos.x > obstacle[0] && pos.x < (obstacle[0] + obstacle[2]) ){ // Check for x axis collision
          if (pos.y > obstacle[1] && pos.y < (obstacle[1] + obstacle[3]) ){ // Check for y axis collision
            return true;
          }
        }
        
      }
      return false;
   }
}
