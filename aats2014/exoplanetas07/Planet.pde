// A Bubble class, reference from DShiffman LoadSaveTable. 

class Planet {
  //name, mass, radius, date, star_name, ra(star?), distance?
  float px, py, pmass, pradius, pdistToSun;
  int pdiscovered; 
  String pname;
  //  float sx,sy, sdiam, smass, sradius
  String sname;
  boolean over;

  //Creating Planet - - - - - - - - - - - - - - - - 
  Planet(float px_, float py_, float pmass_, float pradius_, float pdistToSun_, int pdiscovered_, String pname_, String sname_) {
    pmass = pmass_;
    pradius = 5;//pradius = pradius_*20;
    pdistToSun = pdistToSun_;
    pdiscovered = pdiscovered_;
    pname = pname_;
    pname = sname_;
    over = false;
    px = map(px_, anoInicio, anoFinal, borde*2, p1_w);
    //py = map(py_, 0.00007, 47, p2_h, borde);//en relacion a la masa 
      py = map(py_, 1.0, 47., 270.0, 500. );//en relacion a la masa 
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
  }//end rollover 

  // Display planet - - - - - - - - - - - - - - - - - - - - 
  void display() {
    color colBall = color(200, 200, 0);
    fill(colBall, 150);
    ellipse(px, py, pradius, pradius);
    textSize(8);    text("- "+pdiscovered, px, py);

    sistema(60, "Tierra", 15, .1, "Nuestro Sol", 1.0);
    if (over) {
      colBall = color(250, 250, 0);
      sistema(130, "Exoplaneta: "+pname, 8500, .5, "Estella "+data_s_name, 2.3);
    }//end if


    if (pdiscovered == 2000) {
      colBall = color(250, 0, 0);
      stroke(200);
    }//end if
  }//End display




  // Display planet - - - - - - - - - - - - - - - - - - - - 
  void cartelOver(int _posx, int _posy, String _pname) {//_esta es una var tempora q entra funciona en forma nada mas, tubo var temp 
    int anchoc = 160;
    int altoc = 80;
    int septxt = 5;
    int altot = 10;
    int mov = 40;


    if (_posx >= w-140) {
      mov = -40;
    }

    if (over) {
      noStroke();
      translate(_posx, _posy);// otra opcion antes q nada para todas las formas

      fill(color_bg[1]);
      triangle(0, -5, -5, -10, 5, -10);
      rect (-anchoc/2+mov, -altoc -altot, anchoc, altoc);

      fill(color_bg[0]);
      rect (-anchoc/2+mov, -altoc -altot, anchoc, 20);

      fill(color_bg[2]);
      textSize(10);
      text("Exoplaneta: "+pname, -anchoc/2+mov + septxt, -altoc + 3);

      textSize(9);
      text("Estrella: "+" \nMasa: "+pmass, -anchoc/2+mov + septxt, -altoc + septxt + 20);

      //      resetMatrix();// no afecta al rect extra
    }//end if
  }//cartelOver 



  void sistema(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam) {  
    int factorAmp = 50;
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

    //linea distancia
    stroke(50); 
    line(_sX, _sY, _pX, _pY);
    noStroke();

    //sol
    fill(255, 255, 0, 75);
    ellipse(_sX, _sY, _stam, _stam); 
    fill(color_font[2]);
    textAlign(CENTER); 
    textSize(10);
    text(_sNom, _sX, _sY-10);

    //Planeta
    fill(255, 255, 0, 75);
    ellipse(_pX, _pY, _ptam, _ptam); 
    fill(color_font[2]);
    textAlign(CENTER); 
    text(_pNom, _pX, _sY-10);

    textAlign(LEFT);
  }//end sistema
}//end CLASE







