// A Bubble class, reference from DShiffman LoadSaveTable. 

class Planet {
  //name, mass, radius, date, star_name, ra(star?), distance?
  float px, py, pmass, pradius, pdistToSun;
  int pdate; 
  String pname;

  //  float sx,sy, sdiam, smass, sradius
  //  String sname;

  boolean over = false;


  //Creating Planet - - - - - - - - - - - - - - - - 
  Planet(float px_, float py_, float pmass_ float pradius_, float pdistToSun_, int pdate_, String pname_) {
      px = px_;
      py = py_;
      pmass = pmass_;
      pradius = pradius_;
      pdistToSun = pdistToSun_;
      pdate = pdate_;
      pname = pname_;
  }//end Planet

  // mouse is over planet?
  void rollover(float mx, float my) {
    float dist = dist(px, py, mx, my);
    if (dist < pradius/2) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  // Display planet
  void display() {
    int col = 0;

    if (over) {
      col = 200;
      fill(20);
      textAlign(CENTER);
      text(name, x, y+diameter/2+20);
    }

    stroke(0);
    strokeWeight(2);
    fill(col);
    ellipse(x, y, diameter, diameter);
  }//End display
  
  
}//end CLASE

