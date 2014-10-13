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

//    println(mySin);

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
  for(int i=0; i<40; i++){
    for(int j=0; j<45; j++){
      fill(0);
      noStroke();
      rect(120+14*i, posNamesY-40+6*j, 12, 5);
    }
  }



  //title
  fill(fontColor2);
  textSize(11);
  text("Death people in Gaza during this war period", w/2, 30);    
  //SOURCE
  fill(fontColor2);
  textSize(10);
  text("Source: http://www.xxxxxxx.xxx", w-100, h-20);    


}//END DRAW




