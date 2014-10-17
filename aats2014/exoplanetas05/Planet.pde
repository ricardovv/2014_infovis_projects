// A Bubble class, reference from DShiffman LoadSaveTable. 

class Planet {
  //name, mass, radius, date, star_name, ra(star?), distance?
  float px, py, pmass, pradius, pdistToSun;
  int pdiscovered; 
  String pname;
  //  float sx,sy, sdiam, smass, sradius
  //  String sname;
  boolean over;

  //Creating Planet - - - - - - - - - - - - - - - - 
  Planet(float px_, float py_, float pmass_, float pradius_, float pdistToSun_, int pdiscovered_, String pname_) {
      px = map(px_, anoInicio, anoFinal, borde, p1_w);
      //py = map(py_, 0.00007, 47, p2_h, borde);//en relacion a la masa 
//entre 0.00007 - 0.001
//entre 0.0021 - 0.01
//entre 0.0104772992
//entre 0.02 - 0.098
//entre 0.1 - 1.0
//entre 1.0 - 10
//entre 10 - 20
//entre 20 - 50


      py = map(py_, 0.00007, 47, 100, 20000);//en relacion a la masa 
      pmass = pmass_;
      pradius = 5;//pradius = pradius_*20;
      pdistToSun = pdistToSun_;
      pdiscovered = pdiscovered_;
      pname = pname_;
      over = false;

   }//end Planet


  // mouse is over planet? - - - - - - - - - - - - - - - - - - - - 
  void rollover(float mx, float my) {
    float dist = dist(px, py, mx, my);
    //ellipse(mx, my, 20, 20);

    if (dist <= pradius/2) {
      over = true;
      planetOver = true;//check cuado es over, para mostrar panel 1
    } 
    else  {
      over = false;
      planetOver = false;//check cuado es over, para mostrar panel 1
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
      cartelOver(mouseX, mouseY, "esto es");
    }//end if
    
  }//end detail   
   

 
   
   
  
}//end CLASE








