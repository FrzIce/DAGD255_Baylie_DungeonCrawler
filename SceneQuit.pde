// this class defines a "Game Over" scene
class SceneGameOver {
  SceneGameOver() {
  }
  void update() {
    if (leftPressed) exit();
    if (Keyboard.isDown(Keyboard.ESC)) exit();
  }
  void draw() {
    
      background(100, 0, 150);
      textSize(40);
      fill(0);
      textAlign(CENTER, TOP);
      text("Click to leave the game", width/2, 20);
      textAlign(CENTER, CENTER);
      text("DEFEATED", width/2, height/2 - 40);
      text("You were defeated..... You got to level: " + player.level, width/2, height/2);
    
  }
}
