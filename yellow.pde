
class Yellow extends Particle {

  color c = color(255, 200, 0, 255);
  float spin, angle;
  Yellow(PVector l, PVector v) {
    super(l, v);
  }

  void run() {
    display();
    update();
    checkedges();
    mouse.x = mouseX;
    mouse.y = mouseY;
  }

  void display() {
      spin += random(0,10);
    angle = radians(spin);
    
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    stroke(255,200,0);
    strokeWeight(1);
    noFill();
    ellipse(0, 0,random(20,50),random(20,50));
    ellipse(0, 0,random(20,50),random(20,50));
    noStroke();
    fill(c);
    ellipse(0, 0, 15, 15);
    ellipse(-15,-15,5,5);
    ellipse(-15,15,5,5);
    ellipse(15,-15,5,5);
    ellipse(15,15,5,5);
    popMatrix();
  }

  void update() {

    acc = new PVector(random(-.21, .21), random(-.21, .21));
    vel.add(acc);
    loc.add(vel);
    vel.limit(3);
    //      if (loc.x > game.hero.loc.x && loc.x <= game.hero.loc.x + 20) {
    //           game.hero.vel.div(3);
    //      

    if ( game.hero.loc.x > loc.x - 40)
    {
      if ( game.hero.loc.x < loc.x + 40)
      {
        if ( game.hero.loc.y > loc.y -40)
        {
          if ( game.hero.loc.y < loc.y +40)
          {
            game.hero.vel.div(3);
          }
        }
      }
    }
  }
}




