void setup(){
  size(500,500);
}

void draw(){
  //arc(width/2, height/2,50,50,0,PI);
  //usually start at 0 
  //half moon under, 0 degrees starts at 0 on the right side and then goes left 
 // arc(width/2, height/2,50,50,PI,TWO_PI);
  //half moon upper 
  arc(width/2, height/2,50,50,radians(100),TWO_PI);//radians converts radians>>degres
  //ellipse(width/2, height, 50,50);
}
