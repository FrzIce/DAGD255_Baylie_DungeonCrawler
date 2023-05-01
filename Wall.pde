class Wall extends AABB {
  int type; // 1 - Jungle, 2 - Artic, 3 - Volcano, 4 - Desert


  Wall(float x, float y, float w, float h, int type) {
    this.w = w;
    this.h = h;
    setSize(w, h);
    this.x = x + halfW;
    this.y = y + halfH;
    this.type = type;

    //velocity = new PVector();
  }

  void update() {
    super.update();
    if(type == 1){
     fill(#006F13); 
    }
    else if(type == 2){
     fill(#C9E1FF); 
    }

    if (checkCollision(player)) {
      player.applyFix(player.findOverlapFix(this));
    }
  }


  void draw() {
    if (type == 1){
      fill(#41894D);
    }
    else if (type == 2){
      
    }
    else if (type == 3){
      
    }
    else if (type == 4){
      
    }
    rect(x - halfW, y - halfH, w, h);
  }
}
