  //With respect for all the people that have died and whose names are here.
//Data
Table data;
String data_name; //to store local data ( loadData() ) into global var
int    data_age;
String data_sex;
int data_month;
int data_day;

int    rowCount;//counter for row
int    index;//index for elements

//Setups
int w = 900;
int h = 1200;
int border = 50;
int numDays = 60;
int numElements;
int counter;
int firstName;// to randomly make appear any number, not in order. 

//Positions
int sz = 8;//convert radius to a new size
int sepV = 12;//vertical separation among elements
int sepH = ( w-(border*2) )/numDays;//horzontal separation among elements (dates, people, etc) 
int   posNamesX = 0;
int   posNamesY = 200;

//Fonts
color fontColor1 = color(100);
color fontColor2 = color(200);

//Ciercle Buttons
boolean circleOver = false;
int  circleX = border+sepH/2;
int  circleY = 0;

// Position of circle button
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void setup() {
  size(900, 800);
  background(0); 
  ellipseMode(CENTER);
  smooth();
   loadData();
  //select first name to appear
  firstName = int (random(numElements)  );
  counter = firstName - 1;//start with random name, -1 to fit to data value
 
 println(firstName);
 
 }//END SETUP


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  background(0); 

  if (circleOver) {
    stroke(250, 150);
    strokeWeight(2);
  } 
  else {
    noStroke();
  }

  update(mouseX, mouseY);
  titles();
  display();
  days_months();
  
  textSize(10);
  noStroke();  
     
}//END DRAW - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





