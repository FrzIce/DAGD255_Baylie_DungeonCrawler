class VinePierce extends AABB{
  // a attack that will be used close to the player and travel a short distance
  // this will pierce the enemy with thorny vines
  // to create the image of it drawing, we will need to 
  // - create a rect of the image - vine image, or something along that line
  // - create a rect above the image that travels with it
  // - dont move until it is uncovered
  // - have rect lost parts of itself in a timly manner in a percent like motion
  // - once the rect is gone move distance semi
  // does not move with player
  // - must change hitbox while cover rect changes
  // - ie : at 25% uncovered it must have 75% of the hitbox be gone, and at 50% must have 50% of the hitbox gone.
  // will lose cover from the close side to far side only, no left or right.
  
  float damage;
 
  VinePierce(){
    
  }
  
  void update(){
    
  }
  
  void draw(){
   
    
  }
  
  
  
  
  
  
  
}
