void setup(){
  size(600, 500);
  background(255);
}
  
void draw(){
  strokeWeight(1);
  stroke(30);
  smooth();
  
  point(width,0);
  point(450,500);
  line(width,0,450,500);
  
  noFill();
  stroke(204,102,0);
  //arc(500, 225, 100, 80, PI+QUARTER_PI, TWO_PI);
  arc(500, 225, 100, 80, QUARTER_PI, TWO_PI);
  
 
  }
