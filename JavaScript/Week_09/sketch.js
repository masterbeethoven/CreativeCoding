//changed from Mover[] movers = new Mover[5];
var movers = [];
for(var i=0; i<5;i++){
  movers.push(new Mover());
}
//changed from float
var gravity = 0.1;
var xSpeed = 0;
var ySpeed = 0;
 
//import ddf.minim.*;

Minim minim;
AudioPlayer player;

AudioPlayer one; 
AudioPlayer two; 
AudioPlayer three; 
AudioPlayer four; 
AudioPlayer five; 
AudioPlayer[] array; 

//changed from void 
function setup() {
  //changed from size
  createCanvas(383, 200);
  fill(0);
  for (var i=0; i < movers.length; i++) {
    movers[i] = new Mover(color(random(200)),random(width),random(height),10,0,0);
  minim = new Minim(this);
  
  }
}

//changed from void  
function draw() {
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
   
  //prints out vertical movements, just to make sure it's working
  //println(xSpeed);
   
  //changed from int 
  for (var i=0; i < movers.length; i++) {
    movers[i].gravity();
    movers[i].move();
    movers[i].display();
  }
}
 //changed from mousePressed()
//changed from void 
function touchStarted() {
  Mover b = new Mover(color(random(200)),mouseX,mouseY,10,xSpeed,ySpeed);
  movers = (Mover[]) append(movers,b);
  //every time mouse pressed, random sound from this array for 5 sounds
  array = new AudioPlayer[5];
  array[0] = minim.loadFile("100.wav"); 
  array[1] = minim.loadFile("101.wav"); 
  array[2] = minim.loadFile("105.wav"); 
  array[3] = minim.loadFile("106.wav"); 
  array[4]= minim.loadFile("94.wav");
  var index = var( random(0,5) ); 
  array[index].play(); 

}
 
 
class Mover {
  //changed from float
  var x;
  var y;
  var speedY;
  var speedX;
  var w;
  color c;
  PVector acceleration;
  var mass;
 
  Mover(color c_, var x_, var y_, var w_, var speedX_, var speedY_) {
    
    x = x_;
    y = y_;
    w = w_;
    speedY = speedY_;
    speedX = speedX_;
    c = c_;
    acceleration = new PVector(0,0);
  }
 
  //changed from void 
  function gravity() {
    speedY = speedY + gravity;
  }
 
 //changed from void 
 //the original movers characteristics 
  function display() {
    fill(0,127);
    noStroke();
    strokeWeight(2);
    ellipse((x),(y),(w*2),(w*2));
  }
 
 //changed from void 
 //establishing relationships between the 'height' of where the mover is dropped
 //to its speed 
 //multiple it by -0.95
  function move() {
   
    y = y + speedY;
    if (y > height) {
      speedY = speedY *-0.95;
      y = height;
      //so slow? loadFile the culprit?
      /*player= minim.loadFile("94.wav");
      player.play(); */
   
    }
    x = x + speedX;
    if (x > width) {
      speedX = speedX *-1;
      x = width;
      //right side hits
    }
    if (x < 0) {
      speedX = speedX *-1;
      x = 0;
    }
  }
}
