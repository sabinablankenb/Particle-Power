class InfoArea {
  PVector loc;
  int myWidth, myHeight;
  int infoPanelWidth = 200;

  InfoArea(PVector location, int w, int h) { 
    loc = location;
    myWidth = w;
    myHeight = h;
  }
  void run() {
    menu();
  }

  void menu() {
    //start of base of menu
    //fill(0, 70, 150);
    fill(255);
    stroke(30);
    
    fill(0);
    rect(playAreaWidth-50, playAreaHeight-900, 300, playAreaHeight);
    smooth();
    //end of base of menu
    
    fill(255);
    rect(width-200, 150, 150,150);
    
    textSize(40);
    fill(0);
    
    text("Time:", width - 180, 200);
    textSize(48);
    text((millis() - startTime) / 1000, width - 150, 260);
    
    fill(255);
    rect(width-200, 400, 150, 150);
    
    fill(0);
    textSize(40);
    text("Points:", width -190, 445,150);
    
    fill(0);
    textSize(48);
    text(score, width-150, 505, 150);
    
    fill(255);
    rect(width-200, 650, 150,150);
    
    fill(0);
    textSize(33);
    text("Enemies:", width - 195, 700);
    
    textSize(48);
    text(enemies, width-150, 750);
  }
}
