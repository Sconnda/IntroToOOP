int num = 100;
float Tm = 0;
PVector Cm = new PVector(0,0);
Ball [] b = new Ball[num];                //declare a new ball called b

void setup() {
  size(500, 500);
  for(int i = 0; i < num; i++) {
    b[i] = new Ball(random(1,100));      //initialize b as a new object of the Ball class
    Tm += b[i].m;
  }
}

void draw() {
  background(0);
  PVector Cm = new PVector(0,0);
  for(int i = 0; i < num; i++) {
    b[i].run();         //call b[i]'s run() method
    Cm.x += b[i].loc.x*b[i].m/Tm;
    Cm.x += b[i].loc.y*b[i].m/Tm;
  }
  println(Tm);
}