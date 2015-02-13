void setup(){
  size(500,500);
  frameRate(4);
}

void draw(){
  background(255);
  noFill();
  smooth();
  beginShape(LINES);
    for (int i=0; i<50;i++){
      vertex(random(0,width), random(0,height));
     }
ellipse(random(255),random(255),random(255),random(255));


