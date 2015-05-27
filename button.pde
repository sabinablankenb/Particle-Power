class Button {
  PVector loc;
  
  Button(PVector l) {
    loc = l;
  }

  void display() {
    rect( 50, 50, 200, 200);
    fill(230, 0, 0);  
    rect(loc.x, loc.y, 100, 100); 
    fill(0, 200, 0);
    text ( "Start", 100, 170);
    fill(0, 0, 200);
    textSize(40);
  }

  boolean hit_test() {
    if (mouseX > loc.x && mouseX < loc.x+ 100 && mouseY > loc.y && mouseY < loc.y+100) {
      return true;
    } 
    else {
      return false;
    }
  }
}

