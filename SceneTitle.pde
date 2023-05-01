// this class defines a "Title" scene
class SceneTitle {
  PImage title;

  SceneTitle() {
    //title = loadImage("GR Title.png");
  }
  void update() {   
    if (Keyboard.isDown(Keyboard.ESC)) exit();

    if (Keyboard.isDown(Keyboard.ENTER)) switchToPlay();
  }
  void draw() {
    background(100);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Press ENTER to begin!", width/2, height/2);
    textAlign(CENTER, CENTER);
    text("Surivive mutliple attacks, destory the bosses shield, and defeat the boss to win!", width/2, height/2 + 50);
    textSize(100);
    fill(150, 0, 150);
    text("EVERLANCE", width/2, height/2 - 100);
  }
  void mousePressed() {
  }
}
