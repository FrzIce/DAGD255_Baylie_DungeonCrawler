class Enemy extends AABB {
  float speed;
  float health;
  int type; // 1 - Jungle, 2 - Artic, 3 - Volcano, 4 - Desert
  int exp; // random number

  Enemy(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    if(x <= player.x + 100 && x >= player.x) x += 100;
    if(x >= player.x - 100 && x <= player.x) x -= 100;
    if(y <= player.y + 100 && y >= player.y) y += 100;
    if(y >= player.y - 100 && y <= player.y) y -= 100;
    setSize(100, 100);
    speed = 10;
    velocity = new PVector();
    health = 10;
    exp = int(random(5, 10));
  }

  void update() {
    if(player.isFocused == true)playerTracking(player.x, player.y);
    else if(player2.isFocused == true)playerTracking(player2.x, player2.y);
    x += velocity.x * dt * 10;
    y += velocity.y * dt * 10; 

    velocity.x *= .9;
    velocity.y *= .9;
    
    if(health <= 0) isDead = true;

    super.update();
  }

  void draw() {
    if(type == 1){
      fill(#006F13);
    }
    else if (type == 2)
    {
      fill(#C9E1FF);
    }
    else if (type == 3){
      fill(#7C0A04); 
    }
    else if (type == 4){
      fill(#817600);
    }
    
    rect(x - halfW, y - halfH, w, h);
  }

  void calcAngleToPlayer() {
    float dx = player.x - x;
    float dy = player.y - y;
    angle = atan2(dy, dx);
  }

  void playerTracking(float px, float py) {
    if (px < x) velocity.x = -speed;
    if (px > x) velocity.x = speed;
    if (py < y) velocity.y = -speed;
    if (py > y) velocity.y = speed;
  }
}
