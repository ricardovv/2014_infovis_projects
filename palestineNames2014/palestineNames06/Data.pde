void loadData() {
  // Load CSV file into a Table object
  String fileName = "data.csv";
  data = loadTable(fileName, "header");
   numElements = data.getRowCount();
}



void display() {
   rowCount = 0;
   
  for (TableRow row : data.rows()) {
    // PEOPLE
    data_name = row.getString("name");
    data_age = row.getInt("age");
    data_sex = row.getString("sex");
    data_date = row.getString("date");

     color myPCol = color(0, 0, 0, 100);    //Diferenciate ages
     if (data_age <= 12) {          //kids
      fontColor1 = color(255, 0, 0);
    } else if (data_age <= 30){    //Young
      fontColor1 = color(0, 255, 0);
    } else if (data_age <= 50){    //Adult
      fontColor1 = color(0, 0, 255 ); 
    } else  {                      //Mature
      fontColor1 = color(255 ); 
    }


  fill(fontColor1);     
  textSize(10);
  text("Name - "  + data_name,  50, 10+14*rowCount);     
  int sz = 20;//convert radius to a new size
  ellipse(400, 10+14*rowCount, sz, sz);

  rowCount++;

  }


//MAIN NAME CHANGE
  textAlign(CENTER);
  textSize(20);
  fill(fontColor2);  
  text(data.getString(counter, "name"), w/2, 100  );
  textAlign(LEFT);
  //COUNTER To move through names
  if (frameCount%120 == 0) {// see if 
    counter += 1;
    if (counter == numElements) {//reset counter to 0
      counter = 0;
    }
  }

  
  
}//CLOSE DISPLAY 

