/*
** Cyclist Count by Year At Selected Commuter Locations
** data from:
** https://data.cityofnewyork.us/d/m6ar-24vj?category=Transportation&view_name=Cyclist-Count-by-Year-At-Selected-Commuter-Locatio
** your task: create a unique data visualization.
** for more information on working with data in Processing, see: https://processing.org/tutorials/data/
*/

String[] headers;
int [][]data; 
//2d array needs two sets of []
void setup(){
  // load csv file into String array
  String [] lines = loadStrings("Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv");
  String[] columns = split(lines[1], ",");
  for(int i=0;i<columns.length;i++){
    println(columns[i]);
  }
  //println(lines[1]);
  //println(lines);
}
void draw(){}

//some questions to ask: 
/*number going up over time? 
where is the most populated place? 
*/
