import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// This program plays an Dungeoun Crawler type game
// Copyright Trevor Baylie 2023

SceneTitle sceneTitle;
SceneBiomeSelect sceneBiomeSelect;
ScenePlay scenePlay;
SceneGameOver sceneGameOver;

float dt = 0;
float prevTime = 0;
boolean leftPressed, rightPressed, pLeftPressed, pRightPressed;
float enemyTimer = 2;
int Biome = 1; // 1 - Jungle, 2 - Artic, 3 - Volcano, 4 - Desert v1     5 - Lightning Field v2
int weapon = 1; // 1 - first weapon v1, 2 - second weapon

Player player, player2;
Player camTarget;
Camera camera;

boolean isGamePaused = false;

ArrayList<Wall> walls = new ArrayList();

float backgroundColor = #676767;

Jungle jungle;
Artic artic;
Desert desert;
Volcano volcano;

ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Shock> Shocks = new ArrayList();

ArrayList<StickyBomb> stickys = new ArrayList();

void setup() {
  size(1280, 720, P2D);
  noStroke();
  switchToTitle();

  player = new Player(0, 0);
  player.isFocused = true;
  //player2 = new Player(width/2, height/2);
  camera = new Camera(player);



  //if (Biome == 1) {
  //  jungle = new Jungle();
  //} else if (Biome == 2) {
  //  artic = new Artic();
  //} else if (Biome == 3) {
  //  desert = new Desert();
  //} else if (Biome == 4) {
  //  volcano = new Volcano();
  //} else if (Biome == 5) {
  //}


  ////for(int i = 0; i < 10; i++) {
  //// Circle c = new Circle(random(width), random(height));
  //// circles.add(c);
  ////}

  //for (int i = 0; i < 10; i++) {
  //  Enemy e = new Enemy(random(-950, 950), random(-950, 950));
  //  enemies.add(e);
  //}
}

void draw() {
  // EVERY FRAME
  calcDeltaTime();
  if (sceneTitle != null) {
    sceneTitle.update();
    if (sceneTitle != null) sceneTitle.draw(); // this extra if statement exists because the sceneTitle.update() might result in the scene switching...
  } else if (sceneBiomeSelect != null) {
    sceneBiomeSelect.update();
    if (sceneBiomeSelect != null) sceneBiomeSelect.draw();
  }// this extra if statement exists because the sceneTitle.update() might result in the scene switching...
  else if (scenePlay != null) {
    scenePlay.update();
    if (scenePlay != null) scenePlay.draw(); // this extra if statement exists because the scenePlay.update() might result in the scene switching...
  } else if (sceneGameOver != null) {
    sceneGameOver.update();
    if (sceneGameOver != null) sceneGameOver.draw(); // this extra if statement exists because the sceneGameOver.update() might result in the scene switching...
  }







  // DRAW STUFF

  //  if (Biome == 1) {
  //    jungle.draw();
  //  } else if (Biome == 2) {
  //    artic.draw();
  //  } else if (Biome == 3) {
  //    desert.draw();
  //  } else if (Biome == 4) {
  //    volcano.draw();
  //  } else if (Biome == 5) {
  //  }


  //  for (int j = 0; j < walls.size(); j++) {

  //    walls.get(j).draw();
  //  }
  //  //for(int i = 0; i < circles.size(); i++) {
  //  //  circles.get(i).draw();
  //  //}

  //  for (int i = 0; i < stickys.size(); i++) {
  //    StickyBomb s = stickys.get(i);
  //    s.draw();
  //  }
  //  for (int i = 0; i < enemies.size(); i++) {
  //    enemies.get(i).draw();
  //  }


  //  for (int i = 0; i < Shocks.size(); i++) {
  //    Shock b = Shocks.get(i);
  //    b.draw();
  //  }
  //  player.draw();
  //  //player2.draw();


  //  // popMatrix here

  //  popMatrix();

  //  textSize(40);
  //  textAlign(CENTER, TOP);
  //  fill(0, 0, 25);
  //  text(player.health, width/2, 20);
  //  textSize(40);
  //  textAlign(CENTER, TOP);
  //  fill(0, 0, 25);
  //  text(player.exp, width/3, 20);
  //  textAlign(CENTER, TOP);
  //  fill(0, 0, 25);
  //  text(player.level, 2*width/3, 20);
  //  textSize(40);
  //  textAlign(CENTER, TOP);
  //  fill(0, 0, 25);
  //  text("Health", width/2, 80);
  //  textSize(40);
  //  textAlign(CENTER, TOP);
  //  fill(0, 0, 25);
  //  text("Exp", width/3, 80);
  //  textAlign(CENTER, TOP);
  //  fill(0, 0, 25);
  //  text("Level", 2*width/3, 80);

  //  //LevelUp


  //  if (player.levelUpToken >= 1) {
  //    textAlign(CENTER, TOP);
  //    fill(0, 0, 25);
  //    text("Press which button you would like to level up", width/2, height-200);
  //    textAlign(CENTER, TOP);
  //    fill(0, 0, 25);
  //    text("Z - Health", width/2, height-80);
  //    textSize(40);
  //    textAlign(CENTER, TOP);
  //    fill(0, 0, 25);
  //    text("X - Attack", width/3-30, height-80);
  //    textAlign(CENTER, TOP);
  //    fill(0, 0, 25);
  //    text("C - Defense", 2*width/3+30, height-80);
  //  }
  //  // Then draw HUD
  //}
}

void switchToTitle() {
  sceneTitle = new SceneTitle();
  sceneBiomeSelect = null;
  scenePlay = null;
  sceneGameOver = null;
}
void switchToBiomeSelect() {
  sceneBiomeSelect = new SceneBiomeSelect();
  sceneTitle = null;
  scenePlay = null;
  sceneGameOver = null;
}
void switchToPlay() {
  scenePlay = new ScenePlay();
  sceneTitle = null;
  sceneBiomeSelect = null;
  sceneGameOver = null;
}
void switchToGameOver() {
  sceneGameOver = new SceneGameOver();
  scenePlay = null;
  sceneBiomeSelect = null;
  sceneTitle = null;
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000;
  prevTime = currTime;
}

void mousePressed() {
  if (mouseButton == LEFT) leftPressed = true;
  if (mouseButton == RIGHT) rightPressed = true;
}

void mouseReleased() {
  if (mouseButton == LEFT) leftPressed = false;
  if (mouseButton == RIGHT) rightPressed = false;
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}
