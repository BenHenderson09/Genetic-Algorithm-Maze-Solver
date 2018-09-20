class Goal{
  PVector pos;
  PVector size;
  color goalColour;
  
  void render(){
    fill(goalColour);
    ellipse(pos.x,pos.y,size.x,size.y);
  }
  
}
