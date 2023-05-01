class Camera {
  float x, y;
  float tx, ty;
  float distance;
  Player target;
  float dx, dy;

  Camera(Player p) {
    target = p;
    tx = target.x - width/2;
    ty = target.y - height/2;
    x = tx;
    y = ty;
  }

  void update() {
    tx = target.x - width/2;
    ty = target.y - height/2;
    dx = tx - x;
    dy = ty - y;
    distance = sqrt(dx*dx + dy*dy);

    //target.x <= -480
    //target.y >= 780
    if (target.x <= -480) {
    } else if (target.x >= 480) {
    } else x += dx * 0.1;

    if (target.y >= 760) {
    } else if (target.y <= -760) {
    } else y += dy * 0.1;


    println(target.y);
    //println(x);
  }
}
