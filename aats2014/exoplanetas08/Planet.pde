// A Bubble class, reference from DShiffman LoadSaveTable. 

class Planet {
  //name, mass, radius, date, star_name, ra(star?), distance?
  float px; 
  float py; 
  float pmass; 
  float pradius;
  float pdistToSun;
  int pdiscovered; 
  String pname; 
  
  String sname;
  float sradius;
  boolean over;
  color colBall;
  float rx;

  //Creating Planet - - - - - - - - - - - - - - - - 
  Planet(float px_, float py_, float pmass_, float pradius_, float pdistToSun_, int pdiscovered_, String pname_, String sname_, float sradius_) {
    colBall = color(200, 200, 0);//color bal sistems
    pmass   = pmass_;
    pradius = 4;//pradius = pradius_*20;
    pdistToSun = pdistToSun_;
    pdiscovered = pdiscovered_;
    pname   = pname_;
    sname   = sname_;
    sradius = sradius_;
    over = false;
     px = map(px_, anoInicio, anoFinal, borde*2, p1_w);
     px = px+random(-20, 20);
    //py = map(py_, 0.00007, 47, p2_h, borde);//en relacion a la masa 
      py = map(py_, 1, 47, 650., 240.0 );//en relacion a la masa 
    //1- entre 0.00007 - 0.001 
//          if(pmass <= 0.1)  {  py = map(py_, 0.1, 47., 270.0, 500. );/*en relacion a la masa*/ }
    //2- entre 0.0021 - 0.01 | 0.001 - 0.01
//          if(pmass >= 0.01 && pmass <= 1.0)  {  py = map(py_, 0.1, 1.0, 300.0, 350.0 );/*en relacion a la masa*/ }
    //3- entre 0.0104772992
  //        if(pmass >= 1.0 && pmass <= 50.0)  {  py = map(py_, 1.0, 50.0, 350.0, 550.0 );/*en relacion a la masa*/ }
    //4- entre 0.02 - 0.098
    //5- entre 0.1 - 1.0
    //6- entre 1.0 - 10
    //7- entre 10 - 20
    //8- entre 20 - 50
  }//end Planet




  // mouse is over planet? - - - - - - - - - - - - - - - - - - - - 
  void rollover(float mx, float my) {
    float dist = dist(px, py, mx, my);
    //ellipse(mx, my, 20, 20);
    if (dist <= pradius/2) {
      over = true;
    } 
    else {
      over = false;
    }
  }
  //end rollover - - - - - - - - - - - - - - - - - - - - 





  // - - - - - - - - - - - - - - - - - - - - 
  void sistema(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam, color sistemColor) {  
    int factorAmp = 25;
    //SOL
    float _sX = p1_w-100;//posicion del sol
    float _sY = p1_posY+ posY;
    String _sNom = p2_s_nomb;
    float _stam = p2_s_tam * factorAmp;
    //Planeta
    float _pDistance = map(p2_p_dist, 1.3, 8500, 50, 800);//mapea distancia del planeta a su sol
    float _pX = p1_posX+100;
    //float _pX = _sX-_pDistance;/// pos del planeta menos distancia al sol
    float _pY = p1_posY+posY;
    String _pNom = p2_p_nomb;
    float _ptam = p2_p_tam * factorAmp;
    int txtY;
    
    if(p2_p_nomb == "Tierra"){
      txtY = -30;
    }else{
      txtY = +30;
    }
      
    //linea distancia
    stroke(50); 
    line(_sX, _sY, _pX, _pY);
    noStroke();

    //sol
    fill(sistemColor);
    ellipse(_sX, _sY, _stam, _stam); 
    fill(color_font[2]);
    textAlign(CENTER); 
    textSize(10);
    text(_sNom, _sX, _sY+txtY);

    //Planeta
    fill(sistemColor);
    ellipse(_pX, _pY, _ptam, _ptam); 
    fill(color_font[2]);
    textAlign(CENTER); 
    text(_pNom, _pX, _sY+txtY);

    textAlign(LEFT);
  }
  //end sistema - - - - - - - - - - - - - - - - - - - - 




  // Display planet - - - - - - - - - - - - - - - - - - - - 
  void display() {

    if (over) {
      colBall = color(250, 250, 0);
      //sistema(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam, color sistemColor) {  
      sistema(80, "Exoplaneta: "+pname, 8500, .5, "Estella "+sname, sradius, color(255, 255, 0, 50));
    }//end if

    if (pdiscovered == 2000) {
      colBall = color(250, 0, 0);
      //stroke(200);
    }//end if
    
    fill(colBall, 150);
    ellipse(px, py, pradius, pradius);
    textSize(8);
    //text("- "+pdiscovered, px, py);

  }
  //End display - - - - - - - - - - - - - - - - - - - - 




  // Display planet - - - - - - - - - - - - - - - - - - - - 
  void cartelOver(int _posx, int _posy, String _pname) {//_esta es una var tempora q entra funciona en forma nada mas, tubo var temp 
    int anchoc = 160;
    int altoc = 60;
    int septxt = 5;
    int altot = 10;
    int movx = 40;
    int movy = 1;
    noStroke();

    if (_posx >= w-140) {//al llegar al borde izq, despazar a la der
      movx = -40;
    }
    if (_posy <= 350) {//al llegar al borde izq, despazar a la der
      movy = altoc+(altot*2);
    }

    if (over) {
      translate(_posx, _posy+movy);// otra opcion antes q nada para todas las formas
      fill(color_bg[1]);
//      triangle(0, -5, -5, -10, 5, -10);
      rect (-anchoc/2+movx, -altoc-altot, anchoc, altoc);
        fill(color_bg[0]);
      rect (-anchoc/2+movx, -altoc-altot, anchoc, 20);
        fill(color_bg[2]);
      textSize(10);
      text("Exoplaneta: "+pname, -anchoc/2+movx + septxt, (-altoc + 3));
        textSize(9);
      text("Estrella: "+sname+" \nMasa: "+pmass, -anchoc/2+movx + septxt, -altoc + septxt + 20);
      resetMatrix();// no afecta al rect extra
    }//end if
    
  }
  //cartelOver  - - - - - - - - - - - - - - - - - - - - 
  


}//end CLASE







