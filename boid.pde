//class Boid extends Particle {
//
//  PVector loc, vel, acc, dir;
//  float r;
//  float maxforce;    // Maximum steering force
//  float maxspeed;    // Maximum speed
//  color c = color((int)random(0), (int)random(70,255), (int)random(0), 255);
//  boolean inLoop = false;
//  Boid(PVector l, PVector v) {
//    super(l,v);
//    acc = new PVector(0, 0);
//
//    // This is a new PVector method not yet implemented in JS
//    // vel = PVector.random2D();
//
//    // Leaving the code temporarily this way so that this example runs in JS
//    float angle = random(TWO_PI);
//    vel = new PVector(cos(angle), sin(angle));
//
//    loc = new PVector(x, y);
//    r = 4.0;
//    maxspeed = 2  ;
//    maxforce = 0.05;
//  }
//
//  void run(ArrayList<Boid> boids) {
//    flock(boids);
//    update();
//    checkEdges();
//    display();
//  }
//
//  void applyForce(PVector force) {
//    // We could add mass here if we want A = F / M
//    acc.add(force);
//  }
//
//  // We accumulate a new acc each time based on three rules
//  void flock(ArrayList<Boid> boids) {
//    PVector sep = separate(boids);   // Separation
//    PVector ali = align(boids);      // Alignment
//    PVector coh = cohesion(boids);   // Cohesion
//    // Arbitrarily weight these forces
//    sep.mult(1.5);
//    ali.mult(1.0);
//    coh.mult(1.0);
//    // Add the force vectors to acc
//    applyForce(sep);
//    applyForce(ali);
//    applyForce(coh);
//  }
//
//  // Method to update loc
//  void update() {
//
//    // Update vel
//    vel.add(acc);
//    // Limit speed
//    vel.limit(maxspeed);
//    loc.add(vel);
//    // Reset accelertion to 0 each cycle
//    acc.mult(0);
//    if(this.getInLoop()) vel.mult(0);
//    
//
//  }
//
//  // A method that calculates and applies a steering force towards a target
//  // STEER = DESIRED MINUS vel
//  PVector seek(PVector target) {
//    PVector desired = PVector.sub(target, loc);  // A vector pointing from the loc to the target
//    // Scale to maximum speed
//    desired.normalize();
//    desired.mult(maxspeed);
//
//    // Above two lines of code below could be condensed with new PVector setMag() method
//    // Not using this method until Processing.js catches up
//    // desired.setMag(maxspeed);
//
//    // Steering = Desired minus vel
//    PVector steer = PVector.sub(desired, vel);
//    steer.limit(maxforce);  // Limit to maximum steering force
//    return steer;
//  }
//
//  void display() {
//    //spin += random(0,10);
//    //angle = radians(spin);
//    
//    pushMatrix();
//    translate(loc.x,loc.y);
//    //rotate(angle);
//    stroke(0, 130, 234);
//    stroke(c);
//    strokeWeight(2);
//    noFill();
//    scale(0.5);
//    ellipse(0, 0,random(30,60),random(30,60));
//    ellipse(0, 0,random(30,60),random(30,60));
//    noStroke();
//    fill(c);
//    ellipse(0, 0, 25, 25);
//    ellipse(-18,-18,5,5);
//    ellipse(-18,18,5,5);
//    ellipse(18,-18,5,5);
//    ellipse(18,18,5,5);
//    popMatrix();
//    
//  }
//
//  // Wraparound
//  void checkEdges() {
//    if (loc.x < r) loc.x = width-r;
//    if (loc.y < r) loc.y = height-r;
//    if (loc.x > width-r) loc.x = r;
//    if (loc.y > height-r) loc.y = r;
//  }
//
//  // Separation
//  // Method checks for nearby boids and steers away
//  PVector separate (ArrayList<Boid> boids) {
//    float desiredseparation = 25.0f;
//    PVector steer = new PVector(0, 0, 0);
//    int count = 0;
//    // For every boid in the system, check if it's too close
//    for (Boid other : boids) {
//      float d = PVector.dist(loc, other.loc);
//      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
//      if ((d > 0) && (d < desiredseparation)) {
//        // Calculate vector pointing away from neighbor
//        PVector diff = PVector.sub(loc, other.loc);
//        diff.normalize();
//        diff.div(d);        // Weight by distance
//        steer.add(diff);
//        count++;            // Keep track of how many
//      }
//    }
//    // Average -- divide by how many
//    if (count > 0) {
//      steer.div((float)count);
//    }
//
//    // As long as the vector is greater than 0
//    if (steer.mag() > 0) {
//      // First two lines of code below could be condensed with new PVector setMag() method
//      // Not using this method until Processing.js catches up
//      // steer.setMag(maxspeed);
//
//      // Implement Reynolds: Steering = Desired - vel
//      steer.normalize();
//      steer.mult(maxspeed);
//      steer.sub(vel);
//      steer.limit(maxforce);
//    }
//    return steer;
//  }
//
//  // Alignment
//  // For every nearby boid in the system, calculate the average vel
//  PVector align (ArrayList<Boid> boids) {
//    float neighbordist = 50;
//    PVector sum = new PVector(0, 0);
//    int count = 0;
//    for (Boid other : boids) {
//      float d = PVector.dist(loc, other.loc);
//      if ((d > 0) && (d < neighbordist)) {
//        sum.add(other.vel);
//        count++;
//      }
//    }
//    if (count > 0) {
//      sum.div((float)count);
//      // First two lines of code below could be condensed with new PVector setMag() method
//      // Not using this method until Processing.js catches up
//      // sum.setMag(maxspeed);
//
//      // Implement Reynolds: Steering = Desired - vel
//      sum.normalize();
//      sum.mult(maxspeed);
//      PVector steer = PVector.sub(sum, vel);
//      steer.limit(maxforce);
//      return steer;
//    } 
//    else {
//      return new PVector(0, 0);
//    }
//  }
//
//  // Cohesion
//  // For the average loc (i.e. center) of all nearby boids, calculate steering vector towards that loc
//  PVector cohesion (ArrayList<Boid> boids) {
//    float neighbordist = 50;
//    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locs
//    int count = 0;
//    for (Boid other : boids) {
//      float d = PVector.dist(loc, other.loc);
//      if ((d > 0) && (d < neighbordist)) {
//        sum.add(other.loc); // Add loce
//        count++;
//      }
//    }
//    if (count > 0) {
//      sum.div(count);
//      return seek(sum);  // Steer towards the loc
//    } 
//    else {
//      return new PVector(0, 0);
//    }
//  }
//
//  void setInLoop(boolean inLoop) {
//    this.inLoop = inLoop;
//  }
//
//  boolean getInLoop() {
//    return inLoop;
//  }
//
//}//  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  Class
