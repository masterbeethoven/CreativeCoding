/*
** Cyclist Count by Year At Selected Commuter Locations
** data from:
** https://data.cityofnewyork.us/d/m6ar-24vj?category=Transportation&view_name=Cyclist-Count-by-Year-At-Selected-Commuter-Locatio
** your task: create a unique data visualization.
** for more information on working with data in Processing, see: https://processing.org/tutorials/data/
*/

String[] headers;
int[][] data; 
PImage img;

void setup(){
  size(displayWidth, displayHeight);
  background(209);
  smooth();

  
  // load csv file into String array
  String [] lines = loadStrings("Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv");
  
  //split the first line into an array and load it into our global headers array
  headers = split(lines[0], ",");
  
  //create a temporary 2D String array.
  //we'll think of it as a 28 row x 9 column matrix
  String[][] tempData = new String[lines.length-1][headers.length];
  
  //Curious to see how many rows and columns we're loading into our tempData?
  //uncomment this line below.
  //println( lines.length-1 + " rows by " + headers.length + " cols.");
  
  //loop through each of the subsequent lines after the header row and
  //assign each to the row index of our tempData matrix 
  for(int i = 1; i < lines.length; i++){
    tempData[i-1] = split(lines[i], ",");//assigns an array to each temData row
  }
  
  //construct our global data matrix.
  //we can also think of this as a 28 row x 9 col matrix
  data = new int[tempData.length][tempData[0].length];
  
  //loop through each of the rows and columns of our tempData matrix.
  //a.k.a. nested for loops.
  for(int i = 0; i < tempData.length; i++){ //for each row
    for(int j = 0; j < tempData[i].length; j++){ //and for each col
      
      /*
      * since our raw data has "" (quotes) around each entry,
      * we need a way to remove them.  Let's use the handy split() method.
      * The delimiter is a " (double quotes) but we need to escape it using a forward slash.
      * for more info on escape characters in Java see:
      * http://stackoverflow.com/questions/1367322/what-are-all-the-escape-characters-in-java
      * example: split(""1024"", "\"") becomes --> {"", "1024", ""}  
      */
      String[] tempCellValue = split(tempData[i][j], "\"");
      // our middle entry contains the data, so we write tempCellValue[1]
      // handle our blank data OR data containing "N/A" by replacing with 0s 
      if(tempCellValue[1].equals("") || tempCellValue[1].equals("N/A")){
        data[i][j] = 0;
      }
      else {
        data[i][j] = Integer.parseInt(tempCellValue[1]);
      }
    }
  }
}
void draw(){
  
  img = loadImage("bike.png");
   image(img,0,0);
  // draw something awesome with the data matrix and headers array
  // to access individual data cells all you have to do is call data[row][col],
  // where row is an int row number, and col is an int column number
  //for loop to pull just the heading titles, title[array of all the cities] 
for (int i=1;i<headers.length;i++){
  smooth();
  fill(0);
 //text(headers[i].substring(1,headers[i].length()-1),10,50+i*50);
 text(headers[i],10,50+i*50);
   }
   for (int i=0;i<data.length;i++){
    fill( random(255), random(255), random(255));
      for (int j=0;j<data[0].length;j++){
      int size=data[i][j];
      if(j==0){
        // here j!=8 i.e. we are in the column with the year as value
        // writing each year in text
        //textSize(10);
        text(data[i][j],250+i*30,50+j*50);
      }
       else if (j!=8){
        // here j!=8 i.e. we are in the column with each year's cycle rides
        // normalizing size of ellipse by dividing by 100
      size=size/100;
      ellipse( 250+i*30,50+j*50,size,size);
      }
       else{
        // here j=8 i.e. we are in the Grand Total column
        // normalizing size of ellipse by dividing by 300
      size=size/300;
      ellipse( 250+i*30,50+j*50,size,size); 
    } 
      }
   }
 }
  

