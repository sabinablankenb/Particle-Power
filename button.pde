class Button {
  PVector loc;
  
  Button(PVector l) {
    loc = l;
  }

  void display() {
    image(img, 0, 0, width, height);
    textSize(60);
    text("Particle Power", 600, 200);
    textSize(20);
    text("Click Anywhere To Play", 670, 295); 
    //rect( 50, 50, 200, 200);
    fill(230);  
    //rect(loc.x, loc.y, 100, 100); 
    fill(255);
    textSize(40);
    text(" by Sabina, Erik, Parker, Alex and Chet ", 450, 800); 
    
   
    
  }

  boolean hit_test() {
    if (mouseX > loc.x && mouseX < loc.x+ 1500 && mouseY > loc.y && mouseY < loc.y+900) {
      return true;
    } 
    else {
      return false;
    }
  }
}

