float dt = 0;
float prevTime = 0;
boolean leftPressed, rightPressed, pLeftPressed, pRightPressed;
float enemyTimer = 2;
int Biome = 2; // 1 - Jungle, 2 - Artic, 3 - Volcano, 4 - Desert, 5 - Lightning Field
int weapon = 1; // 1 - first weapon v1, 2 - second weapon

Player player, player2;
Player camTarget;
Camera camera;

boolean isGamePaused = false;

ArrayList<Wall> walls = new ArrayList();

float backgroundColor = #676767;

Jungle jungle;
Artic artic;

ArrayList<Circle> circles = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();

ArrayList<StickyBomb> stickys = new ArrayList();

void setup() {
  size(1280, 720, P2D);
  noStroke();

  player = new Player(0, 0);
  player.isFocused = true;
  //player2 = new Player(width/2, height/2);
  camera = new Camera(player);


  if (Biome == 1) {
    jungle = new Jungle();
  } else if (Biome == 2) {
    artic = new Artic();
  } else if (Biome == 3) {
  } else if (Biome == 4) {
  } else if (Biome == 5) {
  }


  //for(int i = 0; i < 10; i++) {
  // Circle c = new Circle(random(width), random(height));
  // circles.add(c);
  //}

  for (int i = 0; i < 10; i++) {
    Enemy e = new Enemy(random(-950, 950), random(-950, 950));
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
  //jungle.update();
  //artic.update();
  
  if (Biome == 1) {
    jungle.update();
  } else if (Biome == 2) {
    artic.update();
  } else if (Biome == 3) {
  } else if (Biome == 4) {
  } else if (Biome == 5) {
  }


  //if (Keyboard.onDown(Keyboard.TAB)) {
  //  player.isInventory = !player.isInventory;
  //  Inventory.arrangeItems();
  //  isGamePaused = !isGamePaused;
  //}

  if (!isGamePaused) { 



    if (enemyTimer <= 0) {
      Enemy e = new Enemy(random(-950, 950), random(-950, 950));
      enemies.add(e); 
      for (int i = 0; i < bullets.size(); i++) {
        Bullet b = bullets.get(i);
        b.enemiesNotCollided.add(e);
      }
      enemyTimer = 1;
    }
    
    for (int i = 0; i < stickys.size(); i++) {
    StickyBomb s = stickys.get(i);
    s.update();

    for (int j = 0; j < enemies.size(); j++) {
      Enemy e = enemies.get(j);
      if (s.checkCollision(e)) {
        e.velocity.x =50;
        e.velocity.y =50;
      }
      else{
        e.velocity.x =100;
        e.velocity.y =100;
      }
    }
    if (s.checkCollision(player)) {
      player.playerSpeed =150;
      player.playerSpeed =150;
    }
    else{
      player.playerSpeed =300;
      player.playerSpeed =300;
    }

    if (s.isDead){
      stickys.remove(i);
      player.playerSpeed =250;
      player.playerSpeed =250;

    }
  }

    for (int j = 0; j < walls.size(); j++) {

      Wall w = walls.get(j);
      w.update();
    }



    for (int j = 0; j < enemies.size(); j++) {

      Enemy e = enemies.get(j);
      e.update();

      if (player.checkCollision(e)) {
        e.isDead = true;
        player.health -= 10 - player.defense;
      }

      if (e.isDead) {
        player.exp += e.exp;
        enemies.remove(e);
      }
    }

    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.update();



      // testing to cause collision at first hit but stop after it is hit the first time so we can get the bullet to richoeat
      for (int l = 0; l < b.enemiesNotCollided.size(); l++) {
        Enemy n = b.enemiesNotCollided.get(l);      

        if (b.checkCollision(n)) {
          b.colliding = true;
          b.angle = (random(0, 2*PI));
          b.hitPoints--;
          n.health -= player.attack;
          b.enemiesNotCollided.remove(n);
        } else if (!b.checkCollision(n)) {
          b.colliding = false;
        }   

        // end

        if (!b.colliding && b.pColliding) {
        }
      }

      if (b.isDead) bullets.remove(i);
    }


    player.update();
    //player2.update();


    enemyTimer -= dt;
  }



  if (player.health <= 0) {
  }


  // LATE UPDATE
  Keyboard.update();
  pLeftPressed = leftPressed;
  pRightPressed = rightPressed;



  // DRAW STUFF
  
  if (Biome == 1) {
    jungle.draw();
  } else if (Biome == 2) {
    artic.draw();
  } else if (Biome == 3) {
  } else if (Biome == 4) {
  } else if (Biome == 5) {
  }
  

  for (int j = 0; j < walls.size(); j++) {

    walls.get(j).draw();
  }
  //for(int i = 0; i < circles.size(); i++) {
  //  circles.get(i).draw();
  //}
  
  for (int i = 0; i < stickys.size(); i++) {
    StickyBomb s = stickys.get(i);
    s.draw();
    
  }
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).draw();
  }


  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.draw();
  }
  player.draw();
  //player2.draw();


  // popMatrix here

  popMatrix();

  textSize(40);
  textAlign(CENTER, TOP);
  fill(0, 0, 25);
  text(player.health, width/2, 20);
  textSize(40);
  textAlign(CENTER, TOP);
  fill(0, 0, 25);
  text(player.exp, width/3, 20);
  textAlign(CENTER, TOP);
  fill(0, 0, 25);
  text(player.level, 2*width/3, 20);
  textSize(40);
  textAlign(CENTER, TOP);
  fill(0, 0, 25);
  text("Health", width/2, 80);
  textSize(40);
  textAlign(CENTER, TOP);
  fill(0, 0, 25);
  text("Exp", width/3, 80);
  textAlign(CENTER, TOP);
  fill(0, 0, 25);
  text("Level", 2*width/3, 80);

  //LevelUp


  if (player.levelUpToken >= 1) {
    textAlign(CENTER, TOP);
    fill(0, 0, 25);
    text("Press which button you would like to level up", width/2, height-200);
    textAlign(CENTER, TOP);
    fill(0, 0, 25);
    text("Z - Health", width/2, height-80);
    textSize(40);
    textAlign(CENTER, TOP);
    fill(0, 0, 25);
    text("X - Attack", width/3-30, height-80);
    textAlign(CENTER, TOP);
    fill(0, 0, 25);
    text("C - Defense", 2*width/3+30, height-80);
  }
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
