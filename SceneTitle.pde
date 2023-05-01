// this class defines a "Title" scene
class SceneTitle {
  PImage title;

  SceneTitle() {
    //title = loadImage("GR Title.png");
  }
  void update() {   
    if (Keyboard.isDown(Keyboard.ESC)) exit();

    if (Keyboard.isDown(Keyboard.ENTER)) switchToBiomeSelect();
  }
  void draw() {
    background(150);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Press ENTER to begin!", width/2, height/2);
    textAlign(CENTER, CENTER);
    text("battle through mutiple different biomes and level up your skills!", width/2, height/2 + 50);
    textSize(100);
    fill(0, 0, 150);
    text("Elements Unleashed", width/2, height/2 - 100);
  }
  void mousePressed() {
  }
}
