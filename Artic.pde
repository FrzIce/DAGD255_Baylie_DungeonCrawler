class Artic {
  PImage Img;

  Artic() {
    Img = loadImage("artic.jpg");
    walls.add(new Wall(-1050, -1050, 50, 2100, 2)); //left
    walls.add(new Wall(1000, -1050, 50, 2100, 2)); //right
    walls.add(new Wall(-1050, 1000, 2100, 50, 2)); //bottom
    walls.add(new Wall(-1050, -1050, 2100, 50, 2)); //top
    
  }

  void update() {
    
  }

  void draw() {
    image(Img, -1000, -1000);
    //square(-1000, -1000, 2000);
  }
}
