
void loadData() {
int rowCount = 0;

  losDatos = loadTable("exoplanet_eu_catalog.csv", "header");

  totalDatosRows = losDatos.getRowCount();//contaria lel total de filas de datos

  // tamano de array de planetas es total de rows 
  planets = new Planet[losDatos.getRowCount()]; //crea array de objetos planetas

  //get and load data
  for (TableRow row : losDatos.rows()) {
    // PLANETS
    data_p_name = row.getString("# name");
    data_p_mass = row.getFloat(" mass");
    data_p_radius = row.getFloat(" radius");
    data_p_discovered = row.getInt(" discovered");
    float data_p_temperature = row.getFloat(" temp_calculated");
//          minYear = min(  minYear, row.getInt(" discovered") );
  //        maxYear = max(  maxYear, row.getInt(" discovered") );

int firstYear = row.getInt(" discovered");
  
    // STAR
    data_s_name = row.getString(" star_name");
    float data_s_radius = row.getFloat(" ra");
    data_s_distance = row.getFloat(" star_distance");

    // crea objetos planetas 
    //float px_, float py_, float pmass_, float pradius_, float pdistToSun_, int pdiscovered_, String pname_
    //planets[rowCount] = new Planet(data_p_discovered, data_p_radius, 100, data_p_radius, 500, data_p_discovered, data_p_name, data_s_name);
    planets[rowCount] = new Planet(data_p_discovered, data_p_mass, data_p_mass, data_p_radius, 500, data_p_discovered, data_p_name, data_s_name);
    rowCount++;//incremento de rowCount

//  println("rcount; "+ rowCount + " | year: " + firstYear);
  println("datos; "+ totalDatosRows);

  }
  
}//end loaddata

 





/* OLD - - - 
void display(){
 
 textSize(8);
 noStroke();
 
 
 //EXO PLANETS
 fill(200);
 text(rowCount+" | Name - "+ data_p_name, 20, 10+10*rowCount);
 text(" | Radius - " + data_p_radius, 140, 10+10*rowCount);
 text(" | data_p_discovered- " + discovered, 240, 10+10*rowCount);
 color myPCol = color(0, 0, 0, 100);
 
 println(data_p_temperature);
 if (data_p_temperature <= 0.0) {
 myPCol = color(100, 200, 255, 100);
 } 
 else {
 myPCol = color(255, 255, 100, 100);
 }
 //    float tempColor = map(data_p_temperature, 0.0001,20.0, 200., 255. ) ;
 //    fill(tempColor, tempColor, 20, 100);
 
 //PLANETS
 fill(myPCol);
 int newdata_p_radius = int(data_p_radius*10);//convert radius to a new size
 ellipse(400, 20+10*rowCount, newdata_p_radius, newdata_p_radius);
 
 //STARS
 color mySCol = color(255, 205, 100, 20);
 fill(mySCol);
 stroke(10, 100);
 int newdata_s_radius = int(data_s_radius*1);//convert radius to a new size
 ellipse(w-200, 20+10*rowCount, newdata_s_radius, newdata_s_radius);
 
 
 
 }
 
 */
