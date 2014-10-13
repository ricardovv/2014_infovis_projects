// A Bubble class, reference from DShiffman LoadSaveTable. 

class Planet {
  //name, mass, radius, date, star_name, ra(star?), distance?
  float px, py, pmass, pradius, pdistToSun;
  int pdiscovered; 
  String pname;
  //  float sx,sy, sdiam, smass, sradius
  //  String sname;
  boolean over = false;


  //Creating Planet - - - - - - - - - - - - - - - - 
  Planet(float px_, float py_, float pmass_, float pradius_, float pdistToSun_, int pdiscovered_, String pname_) {
      px = map(px_, 1998, 2014, borde, p1_w);
      py = map(py_, 0, 2, p1_h, borde); 
      pmass = pmass_;
      pradius = pradius_*20;
      pdistToSun = pdistToSun_;
      pdiscovered = pdiscovered_;
      pname = pname_;
  }//end Planet

  // mouse is over planet? - - - - - - - - - - - - - - - - - - - - 
  void rollover(float mx, float my) {
    float dist = dist(px, py, mx, my);
     ellipse(mx, my, 20, 20);
    if (dist < pradius/2) {
      over = true;
    } 
    else {
      over = false;
    }
  }//end rollover 

  // Display planet - - - - - - - - - - - - - - - - - - - - 
  void display() {
    int col = 150;
    if (over) {
      col = 250;
     }//end if
    fill(col, 150);
    ellipse(px, py, pradius, pradius);
  }//End display
  
  
 // Display planet - - - - - - - - - - - - - - - - - - - - 
  void detail() {//details on over, names, other scientific info 
    if (over) {
    fill(50); textSize(10); text(pname + " - " + pdiscovered, px, py+10);
    }//end if
  }//end detail   
   
   
   
  
}//end CLASE

