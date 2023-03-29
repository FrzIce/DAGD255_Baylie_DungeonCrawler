class Circle {
  float x, y;
  float diameter;
  float angle;
  
  Circle(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    diameter = random(50, 150);
  }
  
  void update() {
    
  }
  
  void draw() {
    fill(0, 0, 255);
    ellipse(x, y, diameter, diameter);
  }
  
  void calcAngleToPlayer() {
    float dx = player.x - x;
    float dy = player.y - y;
    angle = atan2(dy,dx);
    
  }
  
}
