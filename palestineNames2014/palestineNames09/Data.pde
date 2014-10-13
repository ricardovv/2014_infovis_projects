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
    data_day = row.getInt("day");
    data_month = row.getInt("month");

    //CHANGE COLOR DATA BY AGE (Kids, young, adult, mature
    if (data_age <= 12) {          //kids
      fontColor1 = color(200, 100, 100);
    } else if (data_age <= 30){    //Young
      fontColor1 = color(100, 200, 100);
    } else if (data_age <= 50){    //Adult
      fontColor1 = color(100, 100, 200 ); 
    } else  {                      //Mature
      fontColor1 = color(150); 
    }
    //CHANGE COLOR IF EQUAL TO COUNTER
    if (index == counter){    //Adult
      fontColor1 = color(255, 255, 0 ); 
    }  
       
    
    // - - - - - - - - - - - - - - - - - - - - - 
    //MOVE CIRCLES TO THE LEFT
    circleY = posNamesY; 
    int newCircleX = circleX;
    int[] newCircleY = new int[data.getRowCount()];
    int newSepV = 0;
      
     
    for(int i=1; i<numDays; i++){// A
//         newCircleY[i] = ;
  
        if(data_day == i+1){//cpunts if current i is different than next i
           newCircleX = circleX + sepH * i;
            //newCircleY = 0;
           //newCircleY = sepV * i;
            newCircleY[i] = newCircleY[i] + circleY - sepV*i *3;
           // newCircleY = newCircleY + sepV*rowCount;
         }else{
            //newCircleY = circleY+sepV*i;
         }//close if newSepV = sepV + sepV-i;    
      ellipse(newCircleX, newCircleY[i] + sepV*rowCount , sz, sz);

     }//close for A 
 
    // - - - - - - - - - - - - - - - - - - - - -     
 
 
 
 
 
  //Display text & balls
   fill(fontColor1);   
   textAlign(LEFT, CENTER);  
  textSize(8);
  index = rowCount+1;//index to numbers starting at 1 (not 0) 
//  /text(index + " - " + data_name, 50, posNamesY+sepV*rowCount);//Just Names 
  
  //each personn representation
  //  ellipse(newCircleX, newCircleY+sepV*rowCount, sz, sz);
  //  ellipse(circleX, circleY+sepV*rowCount, sz, sz);
//      ellipse(newCircleX, newCircleY, sz, sz);
//      text(data_age, 6+newCircleX, newCircleY);

    
    
  //ROLLOVERS DETAIL 
  if ( circleOver ) {
    detailsOverPeople( circleX, circleY+sepV*rowCount, "Name of the people", 16 );
  } //CLOSE ROLLOVER DETAILS

  rowCount++;

  }// end for



  //TOP MAIN CHANGING NAME 
  textAlign(CENTER);
  textSize(20);
  fill(fontColor2);  
  text("XXX" + data.getString(counter, "name"), w/2, 100  );
  textAlign(LEFT);

  //COUNTER To move through names
  if (frameCount%120 == 0) {// see if 
    counter += 1;//this start with a random value 
    if (counter == numElements) {//reset counter to 0
      counter = 1;
    }
  }

}//CLOSE DISPLAY 

