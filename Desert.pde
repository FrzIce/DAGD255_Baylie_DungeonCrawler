class Desert {
  PImage Img;

  Desert() {
    Img = loadImage("desert.jpg");
    walls.add(new Wall(-1050, -1050, 50, 2100, 4)); //left
    walls.add(new Wall(1000, -1050, 50, 2100, 4)); //right
    walls.add(new Wall(-1050, 1000, 2100, 50, 4)); //bottom
    walls.add(new Wall(-1050, -1050, 2100, 50, 4)); //top
    
  }

  void update() {
    
  }

  void draw() {
    image(Img, -1000, -1000);
  }
}
