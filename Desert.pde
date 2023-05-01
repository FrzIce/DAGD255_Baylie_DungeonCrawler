class Desert {
  

  Desert() {
    background(#006F13);
    fill(#006F13);
    walls.add(new Wall(-1050, -1050, 50, 2100, 4)); //left
    walls.add(new Wall(1000, -1050, 50, 2100, 4)); //right
    walls.add(new Wall(-1050, 1000, 2100, 50, 4)); //bottom
    walls.add(new Wall(-1050, -1050, 2100, 50, 4)); //top
    
  }

  void update() {
    
  }

  void draw() {
    fill(#006F13);
    square(-1000, -1000, 2000);
  }
}