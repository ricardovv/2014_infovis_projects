//With respect for all the people that have died and whose names are here.
//Data
Table data;
String data_name; //to store local data ( loadData() ) into global var
int    data_age;
String data_sex;
String data_date;
int rowCount;

//Setups
int w = 900;
int h = 800;
int numElements;
int counter;
int firstName;// to randomly make appear any number, not in order. 

int   posNamesX = w/2;
int   posNamesY = h /2;
color fontColor1 = color(100);
color fontColor2 = color(80);



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void setup() {
  size(900, 800);
  background(0); 
  firstName = int (random(numElements) );
  counter = firstName;//to start wit a random name
  loadData();
 }//END SETUP



//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  background(0);  
  titles();
  display();
  
  textSize(10);
  noStroke();  
   
  //PEOPLE'S NAMES
  
}//END DRAW - - - - - - - - - - - - - - - - - - - - - - - - - - - - 














    //ROLLOVERS DETAI 
//        if (  (mouseX>rover_boxX && mouseX<rover_boxX+rover_boxW) && 
//              (mouseY>rover_boxY && mouseY<rover_boxY+boxH)  ) {
//          rect(mouseX, mouseY, 40, 40);
//          detailsOverPeople( rover_boxX, rover_boxY, dataFileName[i], dataFileName[i] );
//        } //CLOSE IF MOUSE OVER




// - - DETAILS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void detailsOverPeople( float _newPosBoxX, float _newPosBoxY, String _name, String _age ) {  
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
  
   // translate(_newPosBoxX-15, _newPosBoxY+20);
  
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

