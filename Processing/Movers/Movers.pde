Mover[] movers = new Mover[5];
float gravity = 0.1;
float xSpeed = 0;
float ySpeed = 0;
 
void setup() {
  size(383, 200);
  fill(0);
  for (int i=0; i < movers.length; i++) {
    movers[i] = new Mover(color(random(200)),random(width),random(height),10,0,0);
  }
}
 
void draw() {
  background(255);
  //if else statement regarding mouseX (horizontal) and mouseY
  //frame by frame basis: different between position of mouse on the horizontal (mouseX) and pmouseX is greater than 0
  // then the speed it's absolute value
  //otherwise, negative
  if ( mouseX-pmouseX > 0 ) {
    xSpeed = abs(mouseX-pmouseX);
  } else {
    xSpeed = -abs(mouseX-pmouseX);
  }
   
   //same for the Y axis
  if ( mouseY-pmouseY > 0 ) {
    ySpeed = abs(mouseY-pmouseY);
  } else {
    ySpeed = -abs(mouseY-pmouseY);
  }
   
  println(xSpeed);
   
  for (int i=0; i < movers.length; i++) {
    movers[i].gravity();
    movers[i].move();
    movers[i].display();
  }
}
 
void mousePressed() {
  Mover b = new Mover(color(random(200)),mouseX,mouseY,10,xSpeed,ySpeed);
  movers = (Mover[]) append(movers,b);
}
 
 
class Mover {
  float x;
  float y;
  float speedY;
  float speedX;
  float w;
  color c;
  PVector acceleration;
  float mass;
 
  Mover(color c_, float x_, float y_, float w_, float speedX_, float speedY_) {
    
    x = x_;
    y = y_;
    w = w_;
    speedY = speedY_;
    speedX = speedX_;
    c = c_;
    acceleration = new PVector(0,0);
  }
 
  void gravity() {
    speedY = speedY + gravity;
  }
 
 //the original movers characteristics 
  void display() {
    fill(0,127);
    noStroke();
    strokeWeight(2);
    ellipse((x),(y),(w*2),(w*2));
  }
 
 //establishing relationships between the 'height' of where the mover is dropped
 //to its speed 
 //multiple it by -0.95
  void move() {
    y = y + speedY;
    if (y > height) {
      speedY = speedY *-0.95;
      y = height;
    }
    x = x + speedX;
    if (x > width) {
      speedX = speedX *-1;
      x = width;
    }
    if (x < 0) {
      speedX = speedX *-1;
      x = 0;
    }
  }
}

