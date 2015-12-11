int num = 2;
float Tm = 0;
float G = 0.1;
PVector Cm = new PVector(0,0);
Ball [] b = new Ball[num];                //declare a new ball called b

void setup() {
  size(500, 500);
  for(int i = 0; i < num; i++) {
    b[i] = new Ball(random(25,75),random(width),random(height),0,0);      //initialize b as a new object of the Ball class
    Tm += b[i].m;
  }
}

void draw() {
  background(0);
  PVector Cm = new PVector(0,0);
  for(int i = 0; i < num; i++) {
    b[i].run();         //call b[i]'s run() method
    Cm.x += (b[i].loc.x*b[i].m);
    Cm.y += (b[i].loc.y*b[i].m);
    for (int j = 0; j < num; j++) {
      if(dist(b[i].loc.x,b[i].loc.y,b[j].loc.x,b[j].loc.y) <= b[i].diam+b[j].diam) {
        if (b[i].m >= b[j].m) {
          b[i].m += b[j].m;
          b[j].m = 0;
        } else if (b[j].m > b[i].m) {
          b[j].m += b[i].m;
          b[i].m = 0;
        }
      }
    }
    b[i].acc.set(G*Tm*(Cm.x/(Tm-b[i].m)-(b[i].m/(Tm-b[i].m)+1)*b[i].loc.x)/pow(abs(dist(b[i].loc.x,b[i].loc.y,Cm.x,Cm.y)),3),G*Tm*(Cm.y/(Tm-b[i].m)-(b[i].m/(Tm-b[i].m)+1)*b[i].loc.y)/pow(abs(dist(b[i].loc.x,b[i].loc.y,Cm.x,Cm.y)),3));
    b[i].accelerate();
  }
  println(Cm);
}