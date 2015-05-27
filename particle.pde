class Particle {

  PVector loc, vel, acc, dir, mouse;
  float spin, angle;

  Particle() {
    loc = new PVector(random(0, 1800), random(0, 1000));
    vel = new PVector(random(-2, 2), random(.2, .2));
    mouse = new PVector(mouseX, mouseY);
  }

  Particle(PVector loc) {
    this.loc = loc;
    vel = new PVector(random(-2, 2), random(.2, .2));
    mouse = new PVector(mouseX, mouseY);
  }

  Particle(PVector loc, PVector vel) {
    this.loc = loc;
    this.vel = vel;
    mouse = new PVector(mouseX, mouseY);
  }

  void run() {
    display();
    update();
    checkedges();
    mouse.x = mouseX;
    mouse.y = mouseY;
  }

  void display() {
    spin += random(0, 10);
    angle = radians(spin);

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    stroke(0, 130, 234);
    noFill();
    ellipse(0, 0, random(30, 70), random(30, 70));
    ellipse(0, 0, random(30, 70), random(30, 70));
    fill(0, 130, 234, 255);
    ellipse(0, 0, 30, 30);
    ellipse(-18, -18, 5, 5);
    ellipse(-18, 18, 5, 5);
    ellipse(18, -18, 5, 5);
    ellipse(18, 18, 5, 5);
    popMatrix();
  }

  void update() {
    acc = new PVector(random(.21, .21), random(.21, .21));
    PVector dir = PVector.sub(mouse, loc);
    if (mousePressed) {
      dir = PVector.sub(loc, mouse);
    }

    dir.normalize();
    dir.mult(.6);
    acc.add(dir);
    vel.add(acc);
    loc.add(vel);
    vel.limit(5);
  }

  void checkedges() {
    if (loc.x > playAreaWidth-75) vel.x = vel.x * (-3);
    if (loc.x < 0) vel.x = vel.x * (-3);
    if (loc.y > height) vel.y = vel.y * (-3);
    if (loc.y < 0) vel.y = vel.y * (-3);
  }
}

