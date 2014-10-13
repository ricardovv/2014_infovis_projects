//With respect for all the people that have died and whose names are here.

int w = 900;
int h = 800;
int posNamesX = w/2;
int posNamesY = h /2;
color fontColor1 = color(100);
color fontColor2 = color(80);
String[] dataFileName;
String[] dates;
int numElements;
int numDays;
int counter;
int firstName;
float mySin = 0.0;
float a = 0.0;


void setup() {
  size(900, 800);
  background(0); 
  dataFileName = loadStrings("names.txt");
  dates = loadStrings("dates.txt");
  numElements = dataFileName.length;
  numDays = 30;
  firstName = int (random(numElements) );
  counter = firstName;//to start wit a random name
}//END SETUP


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  background(0);  
  //    mySin = int(sin(frameCount) *200);
  //    a+= 0.02;
  //COUNTER To move through names
  if (frameCount%120 == 0) {// see if 
    counter += 1;
    if (counter == numElements) {//reset counter to 0
      counter = 0;
    }
  }

  //PEOPLE'S NAMES
  fill(fontColor1);
  textAlign(CENTER);
  textSize(22);
  text(dataFileName[counter], posNamesX, posNamesY-140);

  //COUNTER
  fill(fontColor2);
  textSize(12);
  text(counter+1 + " / " + numElements + " deceased", posNamesX, posNamesY-110);    
 
  //bloques
  for(int i=0; i<numElements; i++){
      fill(50);
      noStroke();
      int boxW = 18;
      int boxH = 6;
      int boxSpacer = 3;
      int boxX = 100;
      int boxY = posNamesY-50+(boxH+boxSpacer) *i;
      
      //order t the right - - - - - - - - - - - - - - - 
      if(int(dates[i]) >= 4) {
        boxX = boxX + boxW + boxSpacer;
        boxY = posNamesY-180+(boxH+boxSpacer) *i;
      }
      if(int(dates[i]) >= 8) {
        boxX = boxX + boxW + boxSpacer;
        boxY = posNamesY-280+(boxH+boxSpacer) *i;
      }
      if(int(dates[i]) >= 12) {
        boxX = boxX + boxW + boxSpacer;
        boxY = posNamesY-380+(boxH+boxSpacer) *i;
      }
      if(int(dates[i]) >= 16) {
        boxX = boxX + boxW + boxSpacer;
        boxY = posNamesY-480+(boxH+boxSpacer) *i;
      }

      rect(boxX, boxY, boxW, boxH);
      textSize(8); fill(150);
      text(i, boxX+2, boxY+8);
      //dates
      textSize(10);
      //      text(i, boxX+30, boxY);
      
      //OVER DATAIL
        if (  (mouseX>boxX && mouseX<boxX+boxW) && (mouseY>boxY && mouseY<boxY+boxH)  ) {
        rect(mouseX, mouseY, 40, 40);
      
      
          detailsOverPeople( boxX, boxY, dataFileName[i], dataFileName[i] );
        } //CLOSE IF MOUSE OVER

  }//CLOSE FOR BOXES

  //title
  fill(fontColor2);
  textSize(11);
  text("Death people in Gaza during this war period", w/2, 30);    
  //SOURCE
  fill(fontColor2);
  textSize(10);
  text("Source: http://www.xxxxxxx.xxx", w-100, h-20);    

}//END DRAW




// - - DETAILS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void detailsOverPeople( float _newPosBoxX, float _newPosBoxY, String _name, String _age ) {  
  int boxW = 150;
  int boxH = 60;
  int boxPosX = 0;
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

