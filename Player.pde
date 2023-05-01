class Player extends AABB {
  float sprint;
  PImage img;
  PImage img2;
  float playerSpeed = 300;
  boolean isFocused = false;
  boolean isHovered = false;
  
  int Element; //1 - Nature, 2 - Ice, 3 - Fire, 4 - Earth, 5 - Air 
  int Weapon; 
  
  //Level up system
  int level = 1; // starts at exp 100 plus 50 each time, etc 100, 150, 200
  int levelUpToken = 0;
  int exp = 0; // certain difference between levels - 1.5/2?
  int expCap = 100;
  //Attributes
  int health = 50; // How much health the player has
  float attack = 1; // influences how much damage is done against enemies
  float defense = 1; // influences how much damage is reduced against you
  //float speed = 10; // how fast you can move as well as how much stamina you have
  //float luck; // increase chances to crits and more exp.
  


  Player(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    img = loadImage("myPlayer.png");
    velocity = new PVector();
    setSize(106, 128);
    sprint = 1;
    level = 1;
  }

  void update() {

    if (isFocused) {//UPDATE INPUT ACTIONS IF THIS PLAYER IS IN FOCUS

      //println(player.x);
      if(exp >= expCap){
       exp -= expCap;
       expCap += 50;
       levelUpToken++;       
      }


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
      
      if (Keyboard.onDown(Keyboard.Z)){
        levelUpToken--;
        level++;
        health += 10;
      }
      if (Keyboard.onDown(Keyboard.X)){
        levelUpToken--;
        level++;
        attack += 1;
      }
      if (Keyboard.onDown(Keyboard.C)){
        levelUpToken--;
        level++;
        defense += 1;
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
    
    
    //stroke(2);
    //line(edgeL, edgeT, edgeL, edgeB);
    //line(edgeR, edgeT, edgeR, edgeB);
    //line(edgeL, edgeT, edgeR, edgeT);
    //line(edgeL, edgeB, edgeR, edgeB);
    //stroke(0);
  }

  void checkHover() {
    float mx = camera.x + mouseX;
    float my = camera.y + mouseY;
    if (mx > x-halfW && mx < x + halfW && my > y-halfH && my < y + halfH) isHovered = true;
    else isHovered = false;
  }
}
