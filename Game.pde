

class Game {
  Hero hero;
  GreenFlock greenFlock;
  ArrayList<Particle> particles = new ArrayList<Particle>();
  ArrayList <Yellow> coins = new ArrayList<Yellow>();
  //ArrayList<Green> greenFlock = new ArrayList<Green>();
  ArrayList<Red> red = new ArrayList<Red>();
  int numberGreen = 10;
  InfoArea infoArea;

  Game() {
    hero = new Hero(new PVector(200, 200));
    infoArea = new InfoArea(new PVector(playAreaWidth, 0), infoPanelWidth, playAreaHeight);
    loadArray();
      //loadGreen();
    Yellow uh = new Yellow(new PVector(100, 100), new PVector(10, 10));
    coins.add(uh);
    showHero = true;
    greenFlock = new GreenFlock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 80; i++) {
    greenFlock.addBoid(new Boid(width/2,height/2));
  }
  }

  void run() {

    runParticles();
    display();
    infoArea.run();
    hero.run();
    greenFlock.run();
  }


  void display() {
    for (int i = 0; i < coins.size(); i++)
    {
      coins.get(i).run();
    }


    // remove g if b comes within 30
    for (int i = greenFlock.boids.size() - 1; i >= 0; i--)
    {
      if (hero.loc.dist(greenFlock.boids.get(i).loc) < 30 )
      {
        greenFlock.boids.remove(i);
        score++;
      }
    }

    for (int i = greenFlock.boids.size() - 1; i >= 0; i--)
    {
      greenFlock.boids.get(i).run(greenFlock.boids);
    }
    for (int i = 0; i < coins.size(); i++)
    {
      if (hero.loc.dist(coins.get(i).loc) < 10 )
      {
        hero.vel.mult(2);
      }
      coins.get(i).run();
    }
    for (int i = 0; i < red.size(); i++)
    {
      if (hero.loc.dist(red.get(i).loc)< 50)
      {
        showHero = false;
      }
      red.get(i).run();
    }
  }
  void runParticles() {
    hero.run();
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).run();
    }

  }
void loadGreen(){
  for(int i = 0; i < numberGreen; i++){
    greenFlock.addBoid(new Boid(random(width),random(height)));
  }
}
  void loadArray() {
  
    for (int i = 0; i < MAX_RED; i++) {
      int x = (int)random(1300);
        int y = (int)random(800);
        red.add(new Red(new PVector(x, y), new PVector(-10, 5)));
      //particles.add(new Red(new PVector(100, 100), new PVector((int)random(-5, 5), (int)random(-5, 5))));
    }
      for (int j = 0; j < MAX_YELLOW; j++) {
        int x = (int)random(1300);
        int y = (int)random(800);
        particles.add(new Yellow(new PVector(x, y), new PVector(-5, 5)));
      }
    }
//        for (int i = 0; i < 2; i++)
//    {
//      red.add(new Red());
//    }
//    
  


}
