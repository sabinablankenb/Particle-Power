
class Hero extends Particle {

  Hero(PVector l)  {
    super(l);
  }

  void run() {
    display();
    update();
    checkedges();
    mouse.x = mouseX;
    mouse.y = mouseY;
  }
  
  
  void display()
  {
    if(showHero){
    spin += random(0,10);
    angle = radians(spin);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    stroke(0, 130, 234);
    strokeWeight(1);
    noFill();
    ellipse(0, 0,random(30,70),random(30,70));
    ellipse(0, 0,random(30,70),random(30,70));
    fill(0, 130, 234, 255);
    ellipse(0, 0, 30, 30);
    ellipse(-18,-18,5,5);
    ellipse(-18,18,5,5);
    ellipse(18,-18,5,5);
    ellipse(18,18,5,5);
    popMatrix();
    } else{
      println("Blue gone");
    }
  }
  
  
  void update()  {
    acc = new PVector(random(.21, .21), random(.21, .21));
    PVector dir = PVector.sub(mouse, loc);
    if (mousePressed)    {
      dir = PVector.sub(loc, mouse);
    }

    dir.normalize();
    dir.mult(.6);
    acc.add(dir);
    vel.add(acc);
    loc.add(vel);
    vel.limit(3);
  }
}

