class Player {
 PVector pos = new PVector();
 float sprint;

  
  Player(float xPos, float yPos) {
    pos.x = xPos;
    pos.y = yPos;
    sprint = 1;
  }
  
  void update() {
    if(Keyboard.isDown(Keyboard.A)) {
      pos.x -= 200 * sprint * dt;
    }
    if(Keyboard.isDown(Keyboard.D)) {
      pos.x += 200 * sprint * dt;
    }
    if(Keyboard.isDown(Keyboard.W)) {
      pos.y -= 200 * sprint * dt;
    }
    if(Keyboard.isDown(Keyboard.S)) {
      pos.y += 200 * sprint * dt;
    }
    
    if(Keyboard.isDown(Keyboard.SHIFT)){
       sprint = 2;
    }
    else {
     sprint = 1; 
    }
    
    //pos.x += camera.x * 0.1;
    //pos.y += camera.y * 0.1;
  }
  
  void draw() {
    fill(255, 0, 0);
    rect(pos.x-50, pos.y-50, 100, 100);
  }
  
}
