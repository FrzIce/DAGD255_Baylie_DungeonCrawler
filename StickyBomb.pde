class StickyBomb extends AABB { // Made by Ethan P - StickBomb class

  float damage;
  float lifeTime = 5.3;
  boolean splashed = false;


  StickyBomb(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    setSize(8, 8);
    velocity = new PVector(800, 800);
  }

  void update() {

    lifeTime -= dt;
    if (!splashed) {
      x += velocity.x * cos(angle) * dt;
      y += velocity.y * sin(angle) * dt;
    }
    if (lifeTime <= 0) isDead = true;
    if (lifeTime <= 5) splashed = true;

    // PREP FOR NEXT FRAME

    super.update();
  }

  void draw() {
    if (splashed) {
      setSize(250, 250);

      fill(255, 0, 0);
    } else {
      fill(0);
    }

    ellipse(x, y, w, h);
  }
}
