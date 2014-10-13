//With respect for all the people that have died and whose names are here.

int w = 800;
int h = 600;
int posNamesX = w/2;
int posNamesY = h /2;
color fontColor1 = color(100);
color fontColor2 = color(80);

String[] dataFileName;

int numElements;
int counter;
int firstName;

float mySin = 0.0;
float a = 0.0;


void setup() {
  size(800, 600);
  background(0); 
  dataFileName = loadStrings("names.txt");
  numElements = dataFileName.length;
  firstName = int (random(numElements) );
  counter = firstName;//to start wit a random name

}//END SETUP



void draw() {
  background(0);  
//    mySin = int(sin(frameCount) *200);
//    a+= 0.02;

  //To move through names
  if (frameCount%120 == 0) {// see if 
    counter += 1;
    if (counter == numElements) {//reset counter to 0
      counter = 0;
    }
  }

  //PEOPLES NAMES
  fill(fontColor1);
  textAlign(CENTER);
  textSize(22);
  text(dataFileName[counter], posNamesX, posNamesY-120);

  //COUNTER
  fill(fontColor1);
  textSize(12);
  text(counter+1 + " / " + numElements + " deceased", posNamesX, posNamesY-90);    
  //  text("firstName random " + firstName, posNamesX, posNamesY+55);    

  //bloques
  for(int i=0; i<numElements; i++){
      fill(80);
      noStroke();
      int boxW = 12;
      int boxH = 5;
      int boxSpacer = 2;
      int boxX = 100+(boxW+boxSpacer)*i;
      int boxY = posNamesY;

      if (  (mouseX > boxX && mouseX < boxX+boxW)  ) {
          detailsOverPeople( boxX, boxY, dataFileName[i], dataFileName[i] );
          scrollArticleSelected = i; //SELECT NUMBER OF ARTOCLE TO LOAD   
      } //CLOSE IF MOUSE OVER

      rect(boxX, boxY, 12, 5);
 

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






// - - DETAILS - - - - - - - - - - - - - - - 
void detailsOverPeople( float _newPosBoxX, float _newPosBoxY, String _name, String _age ) {  
  int boxW = 250;
  int boxH = 85;
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
    translate(_newPosBoxX-15, _newPosBoxY-boxH-15);
    //TRIANGLE BELOW
    fill(50, 150); //COLOR BG colorTop[13]-200 
    triangle(10+dis, boxH+dis, 20+dis, boxH+dis, 15+dis, boxH+dis+10);
    //CAJA Y TRIANG DEBAJO
    fill(20, 150); //COLOR BG colorTop[13]-200 
    rect(boxPosX+dis, 0+dis, boxW+dis, boxH+dis);
    //BOX AND TRIANGE OVER
    fill(150, 220, 250); //COLOR TEXT 
    triangle(10, boxH, 20, boxH, 15, boxH+10);
    rect(boxPosX, 0, boxW, boxH);
      fill(colorsBgSectionsBlues[0]); //COLOR TEXT 
      rect(boxPosX, 0, boxW, 28);//COLOR OF TITLE
    //TEXT
    fill(250);//color text top
    textSize(12);
    textAlign(LEFT);
    text("Article nº "+_name, boxPosX+6, 6, boxW-13, boxH-10 );
    textSize(10);
    fill(20);//color text box
    text("Words: "+_articleWordsNum, boxPosX+180, 8, boxW-15, boxH-1 );
    text("Topics: "+_age, boxPosX+6, 32, boxW-15, boxH-15 );
    text("- click to view text", boxPosX+6, 66, boxW-15, boxH-15 );
  popMatrix();
}//5- CLOSE DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes() - - - - - - - - - - - - - - -  

