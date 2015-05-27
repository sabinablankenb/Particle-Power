
class Red extends Particle {

  color c = color((int)random(150, 255), (int)random(0), (int)random(0), 255);
  float spin, angle;
  Red(PVector l, PVector v)  {
     super(l,v);
  }
  
  void run(){
    display();
    update();
    checkedges();
    mouse.x = mouseX;
    mouse.y = mouseY;
  }

  void display(){
   spin += random(0,5);
    angle = radians(spin);
    
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    stroke(c);
    strokeWeight(4);
    noFill();
    ellipse(0, 0,random(70,150),random(70,150));
    ellipse(0, 0,random(70,150),random(70,150));
    noStroke();
    fill(c);
    ellipse(0, 0, 60, 60);
    ellipse(-45,-45,20,20);
    ellipse(-45,45,20,20);
    ellipse(45,-45,20,20);
    ellipse(45,45,20,20);
    popMatrix();
    
  }
  
   void update()  {
    acc = new PVector(random(-.41, .41), random(-.41, .41));
    PVector dir = PVector.sub(game.hero.loc, loc);
    dir.normalize();
    dir.mult(.3);
    acc.add(dir);
    vel.add(acc);
    loc.add(vel);
    vel.limit(4);
  }
  
  
}
