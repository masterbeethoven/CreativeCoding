int[] xpoints;
int[] ypoints; 
void setup() {
  size(displayWidth, displayHeight);
  background(255);
  frameRate(1);

  xpoints = new int[50];
  ypoints = new int[50];
  strokeWeight(1);
  for (int n=0; n<50; n++) {
    xpoints[n]= (int)random(50, width-50);
    ypoints[n]=(int)random(50, height-50);
    //(cast as)(thing to be) 

    point(xpoints[n], ypoints[n]);
    
   // text("i am point number: "+n, xpoints[n], ypoints[n]);
  }
    stroke(30, 60);
    for (int n=0; n<50; n++) {
    for (int m = 0; m<50; m++) {
      line(xpoints[n], ypoints[n], xpoints[m], ypoints[m]);
    }
  }

}


void draw() {

  //print(xpoints);

}


