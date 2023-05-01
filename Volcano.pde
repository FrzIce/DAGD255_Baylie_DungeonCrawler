class Volcano {
  PImage Img;

  Volcano() {
    Img = loadImage("volcano.png");
    walls.add(new Wall(-1050, -1050, 50, 2100, 3)); //left
    walls.add(new Wall(1000, -1050, 50, 2100, 3)); //right
    walls.add(new Wall(-1050, 1000, 2100, 50, 3)); //bottom
    walls.add(new Wall(-1050, -1050, 2100, 50, 3)); //top
    
  }

  void update() {
    
  }

  void draw() {
    image(Img, -1000, -1000);
  }
}
