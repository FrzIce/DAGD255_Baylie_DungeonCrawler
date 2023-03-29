class Player extends AABB {
  float sprint;
  PImage img;
  PImage img2;
  float playerSpeed = 300;
  boolean isFocused = false;
  boolean isHovered = false;


  Player(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    img = loadImage("myPlayer.png");
    img2 = loadImage("myPlayer2.png");
    velocity = new PVector();
    setSize(106, 128);
    sprint = 1;
  }

  void update() {

    if (isFocused) {//UPDATE INPUT ACTIONS IF THIS PLAYER IS IN FOCUS


      calcAngleToMouse();

      if (leftPressed && !pLeftPressed) {
        float bx = x + cos(angle) * halfW; //pushing the bullet to spawn at the tip of the player
        float by = y + sin(angle) * halfH;
        Bullet b = new Bullet(bx, by, angle, 10); 
        bullets.add(b);
      }

      if (Keyboard.onDown(Keyboard.E)) {
        if (camTarget != null) {
          camera.target = camTarget;
          camTarget.isFocused = true;
          this.isFocused = false;
        }
      }

      if (Keyboard.isDown(Keyboard.A)) {
        velocity.x = -playerSpeed;
      }
      if (Keyboard.isDown(Keyboard.D)) {
        velocity.x = playerSpeed;
      }
      if (Keyboard.isDown(Keyboard.W)) {
        velocity.y = -playerSpeed;
      }
      if (Keyboard.isDown(Keyboard.S)) {
        velocity.y = playerSpeed;
      }


      if (Keyboard.isDown(Keyboard.SHIFT)) {
        sprint = 2;
      } else {
        sprint = 1;
      }

      x += velocity.x * dt * sprint;
      y += velocity.y * dt * sprint; 

      velocity.x *= 0.9;
      velocity.y *= 0.9;
    } // END FOCUS CODE

    if (!isFocused) {
      checkHover();
    }

    if (isHovered && !isFocused)camTarget = this;
    else camTarget = null;

    // PREP FOR NEXT FRAME
    super.update();
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotate(angle + PI/2);

    if (!isFocused && isHovered)
    {
      image(img2, -halfW, -halfH);
      popMatrix();
    } else {
      image(img, -halfW, -halfH);
      popMatrix();
    }
  }

  void checkHover() {
    float mx = camera.x + mouseX;
    float my = camera.y + mouseY;
    if (mx > x-halfW && mx < x + halfW && my > y-halfH && my < y + halfH) isHovered = true;
    else isHovered = false;
  }
}
