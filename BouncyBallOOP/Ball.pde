class Ball {
 //declaring all information (fields) contained within the Ball class
  PVector loc, vel, acc;
  float m;
  float diam;
  color c;

//this is a constructor. you can have more than one constructor for a given class
  Ball() {
    m = 25;
    diam = 10*pow(m,0.333333);
    loc = new PVector(random(diam/2+1, width-diam/2-1), random(diam/2+1, height-diam/2-1));
    vel = PVector.random2D();
    acc = new PVector(0,0);
    c = color(random(100,255), 0, 0, random(100, 255));
  }

  Ball(float diameter, float x, float y,float vx, float vy) {
    diam = diameter;
    m = pow(diam/10,3);
    loc = new PVector(x, y);
    vel = new PVector(vx,vy);
    acc = new PVector(0,0);
    c = color(random(100,255), 0, 0, random(100, 255));
  }

//after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void move() {
    loc.add(vel);
    if (loc.x > width) {
      loc.x -= vel.x;
      vel.x *= -1;
    } else if (loc.x < 0) {
      loc.x -= vel.x;
      vel.x *= -1;
    }
    if (loc.y > height) {
      loc.y -= vel.y;
      vel.y *= -1;
    } else if (loc.y < 0) {
      loc.y -= vel.y;
      vel.y *= -1;
    }
  }
  void run() {
    display();
    move();
  }
  void grow() {
    diam = 10*pow(m,0.333333);
  }
  void accelerate() {
    vel.add(acc);
  }
}