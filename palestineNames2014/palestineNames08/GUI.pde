//TITLES
void titles() {
  textAlign(CENTER);
  fill(fontColor2);
  textSize(11);
  text("Death people in Gaza during this war period (20/6 - 25/7)", w/2, 30);    
  //SOURCE
  fill(fontColor2);
  textSize(10);
  text("Source: http://www.xxxxxxx.xxx", w-100, h-20);    
}


// - - UPDATE ROLLOVERS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void update(int x, int y) {
  if( overCircle(circleX, circleY, sz) ) {
    circleOver = true;
   } else {
    circleOver = false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}



// - - DETAILS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void detailsOverPeople( float _newPosBoxX, float _newPosBoxY, String _name, int _age ) {  
  int boxW = 150;
  int boxH = 60;
  int boxPosX = 0;
  int boxPosY = 0;
  int moveX = -150;
  int dis = 2;
   noStroke();

  pushMatrix();
    //CHECK IF IS BEYOND WIDTH
    if (mouseX > width-boxW) {
      boxPosX = boxPosX+ moveX;
    } else {
      boxPosX = 0;
    } 

    // cajas personas aca?
    fill(150, 150, 0);
    rect(boxPosX, boxPosY, 100, 10);
    textSize(8); fill(150);
    text(_name, _newPosBoxX+2, _newPosBoxY+8);
  
    translate(_newPosBoxX-15, _newPosBoxY+20);
  
    //BOX AND TRIANGE OVER
    fill(150); //COLOR TEXT 
    triangle(14, 0, 30, 0, 22, -12);
    rect(boxPosX, 0, boxW, boxH);
    //TEXT
    fill(100);//color text top
    textSize(12);
    textAlign(LEFT);
    text(_name + "/n"+ "xx years.", boxPosX+6, 6, boxW-13, boxH-10 );
    textAlign(CENTER);
  popMatrix();
}//5- CLOSE DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes() - - - - - - - - - - - - - - -  



void days_months() {
  int days_posX = circleX;
    for(int k=0; k<numDays; k++){
        stroke(250, 200, 0);
        point(days_posX+sepH*k, posNamesY-15);
        fill(fontColor2);
        textSize(9);
        if(  (k+1)%5 == 0 ||  k == 0  || k == numDays ){//if k is 1 or % of 5...      
          text(k+1, days_posX-3+sepH*k, posNamesY-20);
        }
  }// end for
}// end days_month
