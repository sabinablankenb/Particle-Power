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
    fill(0, 70, 150);
    stroke(30);

    rect(playAreaWidth-50, playAreaHeight-900, 300, playAreaHeight);
    smooth();
    //end of base of menu
    
    fill(30,30,175);
    rect(width-200, 150, 150,150);
    
    textSize(40);
    fill(255);
    
    text("Time:", width - 180, 200);
    textSize(48);
    text(startTime, width - 150, 260);
    
    fill(30,30,175);
    rect(width-200, 400, 150,150);
    
    text(score, 100, 100, 100);
  }
}
