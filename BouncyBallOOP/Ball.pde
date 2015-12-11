class Ball {
 //declaring all information (fields) contained within the Ball class
  PVector loc, vel;
  float m;
  float diam;
  color c;

//this is a constructor. you can have more than one constructor for a given class
  Ball() {
    m = 25;
    diam = 10*pow(m,0.333333);
    loc = new PVector(random(diam/2+1, width-diam/2-1), random(diam/2+1, height-diam/2-1));
    vel = PVector.random2D();
    c = color(random(100,255), 0, 0, random(100, 255));
  }

  Ball(float mass) {
    m = mass;
    diam = 10*pow(m,0.333333);
    loc = new PVector(random(diam/2+1, width-diam/2-1), random(diam/2+1, height-diam/2-1));
    vel = PVector.random2D();
    c = color(random(100,255), 0, 0, random(100, 255));
  }

//after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void move() {
    if (loc.x > width) {
      loc.x = width;
      vel.x *= -1;
    } else if (loc.x < 0) {
      loc.x = 0;
      vel.x *= -1;
    }
    if (loc.y > height) {
      loc.y = height;
      vel.y *= -1;
    } else if (loc.y < 0) {
      loc.y = 0;
      vel.y *= -1;
    }
    loc.add(vel);
  }
  void run() {
    display();
    move();
  }
}