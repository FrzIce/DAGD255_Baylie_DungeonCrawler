float dt = 0;
float prevTime = 0;
boolean leftPressed, rightPressed, pLeftPressed, pRightPressed;

Player player, player2;
Player camTarget;
Camera camera;

ArrayList<Circle> circles = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();

void setup() {
  size(1280, 720, P2D);
  noStroke();

  player = new Player(width/2, height/2);
  player.isFocused = true;
  player2 = new Player(width/2, height/2);
  camera = new Camera(player);

  //for(int i = 0; i < 10; i++) {
  // Circle c = new Circle(random(width), random(height));
  // circles.add(c);
  //}

  for (int i = 0; i < 10; i++) {
    Enemy e = new Enemy(random(width), random(height));
    enemies.add(e);
  }
}

void draw() {
  // EVERY FRAME
  calcDeltaTime();
  background(255);
  // pushMatrix here.
  pushMatrix();
  translate(-camera.x, -camera.y); // This magical line of code makes Dungeon Crawler possible.

  // UPDATE STUFF
  camera.update(); // THIS MUST ALWAYS BE THE FIRST THING YOU UPDATE

  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.update();

    for (int j = 0; j < enemies.size(); j++) {
      
      Enemy e = enemies.get(j);
      if (b.checkCollision(e)) {
        b.isColliding = true;
        b.isDead = true;
        
      }
    }

    if (b.isDead) bullets.remove(i);
  }

  player.update();
  player2.update();


  // LATE UPDATE
  Keyboard.update();
  pLeftPressed = leftPressed;
  pRightPressed = rightPressed;


  // DRAW STUFF
  //for(int i = 0; i < circles.size(); i++) {
  //  circles.get(i).draw();
  //}
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).draw();
  }


  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.draw();
  }
  player.draw();
  player2.draw();
  // popMatrix here
  popMatrix();
  // Then draw HUD
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000;
  prevTime = currTime;
}

void mousePressed() {
  if (mouseButton == LEFT) leftPressed = true;
  if (mouseButton == RIGHT) rightPressed = true;
}

void mouseReleased() {
  if (mouseButton == LEFT) leftPressed = false;
  if (mouseButton == RIGHT) rightPressed = false;
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}
