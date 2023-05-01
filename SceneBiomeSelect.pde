// this class defines a "Title" scene
class SceneBiomeSelect {
  PImage title;

  SceneBiomeSelect() {
    //title = loadImage("GR Title.png");
  }
  void update() {   
    if (Keyboard.isDown(Keyboard.ESC)) exit();

    if (Keyboard.isDown(Keyboard.one)) {
      Biome = 1;
      switchToPlay();
    }
    if (Keyboard.isDown(Keyboard.two)) {
      Biome = 2;
      switchToPlay();
    }
    if (Keyboard.isDown(Keyboard.three)) {
      Biome = 3;
      switchToPlay();
    }
    if (Keyboard.isDown(Keyboard.four)) {
      Biome = 4;
      switchToPlay();
    }
  }
  void draw() {
    println("testing");
    background(150);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Which Biome would you like to enter?", width/2, height/2);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("1 - Jungle, 2 - Artic, 3 - Desert, 4 - Volcano!", width/2, height/2 - 100);
  }
  void mousePressed() {
  }
}
