class Enemy extends AABB{
  
  Enemy(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    setSize(100, 100);
  }
  
  void update() {
    super.update();
  }
  
  void draw() {
    fill(0, 0, 255);
    rect(x - halfW, y - halfH, w, h);
  }
  
  void calcAngleToPlayer() {
    float dx = player.x - x;
    float dy = player.y - y;
    angle = atan2(dy,dx);
    
  }
  
}
