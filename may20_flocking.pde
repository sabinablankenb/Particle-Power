
int MAX_YELLOW = 2;
int MAX_RED = 2;
Boolean started = false;
Game game  = new Game();
Button button = new Button(new PVector(100, 100));
int playAreaHeight = 900;
int playAreaWidth = 1500;
int infoPanelWidth = 200;
boolean showHero = true;
int scrnWidth = playAreaWidth + infoPanelWidth;
PImage img;
int score;
int startTime;

void setup(){
 size(scrnWidth, playAreaHeight);
 score = 0;
 startTime = 0;
 startTime = startTime - millis() / 1000;
 
background(255);
 
}

void draw(){
 
  if (started == true) {
    background(22, 20, 60,10); 
    //image(img,0,0,width-275,height);
    game.run();
    startTime = startTime + millis();
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

