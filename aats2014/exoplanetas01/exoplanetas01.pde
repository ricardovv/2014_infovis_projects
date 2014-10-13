//Ricardo Vega M. Exoplanets / 2014
//name, mass, radius, date, star_name, ra(star?), distance?
Table dataTable;//new table to load data
int index;
int w = 1000;
int h = 1500;

void setup(){
  size(w, h);
  index = 0;
}

void draw(){
  background(50);

     translate(0, -mouseY);//desplaza la magen hacia arriba apra verlos
  loadData();

}



void loadData() {
  // Load CSV file into a Table object
  // "header" indicates file has header row
  dataTable = loadTable("exoplanet_eu_catalog.csv", "header");
  // The size of the array of Bubble objects is determined by the total number of rows in the CSV
   // You can access iterate over all the rows in a table
  int rowCount = 0;
  index = rowCount;
  for (TableRow row : dataTable.rows()) {
    // PLANETS
    String p_name = row.getString("# name");
    float p_radius = row.getFloat(" radius");
    int discovered = row.getInt(" discovered");
    float p_temperature = row.getFloat(" temp_calculated");
    float maxData = dataTable.getInt(rowCount, " radius");
    // STAR
    String s_name = row.getString(" star_name");
    float s_radius = row.getFloat(" ra");
 

    textSize(7);
    noStroke();
    
    //EXO PLANETS
    fill(200);
    text(rowCount+" | Name - "+ p_name, 20, 10+10*rowCount);
    text(" | Radius - " + p_radius, 140, 20+10*rowCount);
    text(" | Discovered - " + discovered, 240, 20+10*rowCount);
    color myPCol = color(0, 0, 0, 100);
    
    println(p_temperature);
    if (p_temperature <= 0.0) {
      myPCol = color(100, 200, 255, 100);
    } else {
      myPCol = color(255, 255, 100, 100);
    }
    //    float tempColor = map(p_temperature, 0.0001,20.0, 200., 255. ) ;
    //    fill(tempColor, tempColor, 20, 100);
    
    //PLANETS
    fill(myPCol);
    int newP_Radius = int(p_radius*20);//convert radius to a new size
    ellipse(400, 20+10*rowCount, newP_Radius, newP_Radius);

    //STARS
    color mySCol = color(255, 205, 100, 20);
    fill(mySCol);
    stroke(10, 100);
    int newS_Radius = int(s_radius*1);//convert radius to a new size
    ellipse(w-100, 20+10*rowCount, newS_Radius, newS_Radius);

    rowCount++;

  }

}
  
  
  
  
  void maxmin(float _value) {
    float maxValue = 0;  
    if(_value >= maxValue){
        maxValue = _value;
    }else{
        maxValue = 30;
    }
           //println("max values is: "+ maxValue);
 
  }
