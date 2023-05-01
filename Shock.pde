class Shock extends AABB {
  float damage;
  float lifeTime = 4;
  boolean colliding;
  boolean pColliding;
  float collisionIFrame = 1;
  int hitPoints = 3;
  ArrayList<Enemy> enemiesNotCollided = new ArrayList();


  Shock(float x, float y, float angle, float damage) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    setSize(8, 8);
    velocity = new PVector(1800, 1800);
    this.damage = random(damage, damage + 4);
    colliding = false;
    for (int j = 0; j < enemies.size(); j++) {
      Enemy e = enemies.get(j);
      enemiesNotCollided.add(e);
    }
  }

  void update() {
    lifeTime -= dt;

    x += velocity.x * cos(angle) * dt;
    y += velocity.y * sin(angle) * dt;

    //if (colliding == true) {
    //  collisionIFrame -= dt;
    //} else {
    //  collisionIFrame = 1;
    //}


    if (lifeTime <= 0 || hitPoints <= 0) isDead = true;
    // PREP FOR NEXT FRAME

    super.update();
    //pColliding = colliding;
  }

  void draw() {
    stroke(5);
    fill(#FCE800);
    ellipse(x, y, w, h);
    noStroke();
  }
}
