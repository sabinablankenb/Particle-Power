PImage img ; //start screen
int MAX_YELLOW = 10;
int MAX_RED = 2;
Boolean started = false;
Game game  = new Game();
Button button = new Button(new PVector(0, 0));
int playAreaHeight = 900;
int playAreaWidth = 1500;
int infoPanelWidth = 200;
boolean showHero = true;
int scrnWidth = playAreaWidth + infoPanelWidth;
int enemies;
int score;
int startTime;
boolean timeSet;


void setup(){
 size(scrnWidth, playAreaHeight);
 score = 0;
 enemies = 80;
 startTime = 0;
 startTime = startTime - millis() / 1000;
 img = loadImage("particle.jpg");
background(255);
 
}

void draw(){
 
  if (started == true) {
    //background(22, 20, 60,10); 
    background(255);
    game.run();
    if (!timeSet) {
      startTime = millis();
      timeSet = true;
    }
  }
  else {
    button.display();
  }
}



void mousePressed() {
  if (button.hit_test()) {
    started = true;

    
  }
}

