import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class exoplanetas07 extends PApplet {

//Ricardo Vega M. Exoplanets / Santiago de Chile, 2014
//desarrollado en el marco del proyecto AATS, Museo de Arte Contemporaneo, 
//name, mass, radius, date, star_name, ra(star?), distance?

//por ver
//planeta mas grande y pequen
//distancia del sol maxima y minima

//FONTS
PFont titFont;
PImage img_bg;
//Tamanos y posiciones
int w = 1000;
int h = 700;
//grillas
float grilla = w/20;//50 px
float grillita = grilla/5;//10 px
float borde = grillita*2;
float spacer_years;

//panel 1 - w, h, al, an.
float p1_w = w-borde*2;
float p1_h = grilla*4-grillita/2;//200-5
float p1_posX = borde;
float p1_posY = grilla+grillita;

//panel 2 - w, h, al, an.
float p2_posX = borde;
float p2_posY = p1_posY + p1_h ;
float p2_w = w-borde*2;
float p2_h = grilla*9-grilla/2;//450-25

int anoInicio = 1995;
int anoFinal = 2014;
int cantidadYears = anoFinal-(anoInicio-1);//cantidad de anios a mostrar
int data_p_discovered; 
//21

//Colores; verde, rosado, celeste
int[] color_font = {  
  color(50, 255, 150), color(255, 100, 250), color(0, 235, 250)
}; 
//Colores; morado, azul, blanco
int[] color_bg = {  
  color(100, 0, 200), color(60, 80, 160), color(50, 255, 150)
}; 
int colBG = 240;


//Data
Table losDatos;//new table to load data
int totalDatosRows; //para tener el total de rows de datos
float minYear = 0;
float maxYear = 0;

//PLANETS
float data_s_distance;
float data_p_mass;
float data_p_radius;
String data_p_name;
String data_p_details;

String data_s_name;  

Planet[] planets;





public void setup() {
  size(w, h);
  background(colBG);
  loadData();
  smooth();
  img_bg = loadImage("exoplanetas03_bg.jpg");
  titFont = loadFont("HermeneusOne-Regular-48.vlw");
  spacer_years = p1_w/cantidadYears;

  for (Planet p : planets) {  
    p.display();
    p.rollover(mouseX, mouseY);
  }//end for

  for (Planet p : planets) {  
    p.cartelOver(mouseX, mouseY, data_p_name);
    //    p.sistema(60, "Tierra", 15, .1, "Nuestro Sol", 1.0);
    //    p.sistema(130, "Exoplaneta "+data_p_name, 8500, .5, "Estella "+data_s_name, 2.3);
  }//end for

  cursor(CROSS);
}//emd setup





public void draw() {
  background(colBG);   
  image(img_bg, 0, 0);  

  // Display planets
  //  translate(borde, borde);//mueve todo
  //  fill(20, 20);
  dataSource();

  panel1();
  panel2();

  for (Planet p : planets) {  
    p.display();
    p.rollover(mouseX, mouseY);
  }//end for

  for (Planet p : planets) {  
    p.cartelOver(mouseX, mouseY, data_p_name);
    //    p.sistema(60, "Tierra", 15, .1, "Nuestro Sol", 1.0);
    //    p.sistema(130, "Exoplaneta "+data_p_name, 8500, .5, "Estella "+data_s_name, 2.3);
  }//end for


  println(spacer_years);
}//end draw




public void years(float x_, float y_){
   int bgYears_h = 20;
  //bg years
   fill(30);
   rect(x_, y_, p2_w, -bgYears_h);  

  for(int i=0; i<cantidadYears; i++){   
   fill(color_font[2]);
   textAlign(CENTER); 
   textSize(10);
   text(anoInicio+i, borde+4 + x_+spacer_years*i,  y_-6);//texto years
   textAlign(LEFT); 

   stroke(40);
   line(x_+spacer_years*i, y_,    x_+spacer_years*i,  y_-p2_h);//
   noStroke();
 }

}//end years





public void dataSource(){
   //texto datos eoplanetas abajo panel2
   fill(color_font[0]);
   textAlign(RIGHT); 
   textSize(12);
   text("Datos: exoplanets.org", w-borde*3,  borde*2.5f);//texto years
   textAlign(LEFT); 
}



public void mousePosition(){
  fill(0);
  rect(mouseX-5, mouseY, 75, -15);
  fill(250); textSize(10);
  text("x: "+mouseX +" | y: "+mouseY, mouseX-5, mouseY-5);
}








public void loadData() {
int rowCount = 0;

  losDatos = loadTable("exoplanet_eu_catalog.csv", "header");

  totalDatosRows = losDatos.getRowCount();//contaria lel total de filas de datos

  // tamano de array de planetas es total de rows 
  planets = new Planet[losDatos.getRowCount()]; //crea array de objetos planetas

  //get and load data
  for (TableRow row : losDatos.rows()) {
    // PLANETS
    data_p_name = row.getString("# name");
    data_p_mass = row.getFloat(" mass");
    data_p_radius = row.getFloat(" radius");
    data_p_discovered = row.getInt(" discovered");
    float data_p_temperature = row.getFloat(" temp_calculated");
//          minYear = min(  minYear, row.getInt(" discovered") );
  //        maxYear = max(  maxYear, row.getInt(" discovered") );

int firstYear = row.getInt(" discovered");
  
    // STAR
    data_s_name = row.getString(" star_name");
    float data_s_radius = row.getFloat(" ra");
    data_s_distance = row.getFloat(" star_distance");

    // crea objetos planetas 
    //float px_, float py_, float pmass_, float pradius_, float pdistToSun_, int pdiscovered_, String pname_
    //planets[rowCount] = new Planet(data_p_discovered, data_p_radius, 100, data_p_radius, 500, data_p_discovered, data_p_name, data_s_name);
    planets[rowCount] = new Planet(data_p_discovered, data_p_mass, data_p_mass, data_p_radius, 500, data_p_discovered, data_p_name, data_s_name);
    rowCount++;//incremento de rowCount

//  println("rcount; "+ rowCount + " | year: " + firstYear);
  println("datos; "+ totalDatosRows);

  }
  
}//end loaddata

 





/* OLD - - - 
void display(){
 
 textSize(8);
 noStroke();
 
 
 //EXO PLANETS
 fill(200);
 text(rowCount+" | Name - "+ data_p_name, 20, 10+10*rowCount);
 text(" | Radius - " + data_p_radius, 140, 10+10*rowCount);
 text(" | data_p_discovered- " + discovered, 240, 10+10*rowCount);
 color myPCol = color(0, 0, 0, 100);
 
 println(data_p_temperature);
 if (data_p_temperature <= 0.0) {
 myPCol = color(100, 200, 255, 100);
 } 
 else {
 myPCol = color(255, 255, 100, 100);
 }
 //    float tempColor = map(data_p_temperature, 0.0001,20.0, 200., 255. ) ;
 //    fill(tempColor, tempColor, 20, 100);
 
 //PLANETS
 fill(myPCol);
 int newdata_p_radius = int(data_p_radius*10);//convert radius to a new size
 ellipse(400, 20+10*rowCount, newdata_p_radius, newdata_p_radius);
 
 //STARS
 color mySCol = color(255, 205, 100, 20);
 fill(mySCol);
 stroke(10, 100);
 int newdata_s_radius = int(data_s_radius*1);//convert radius to a new size
 ellipse(w-200, 20+10*rowCount, newdata_s_radius, newdata_s_radius);
 
 
 
 }
 
 */
public void panel1() {
  //BG 
  fill(10);
  rect(p1_posX, p1_posY, p1_w, p1_h-5);
  //Descripcion Panel 1
  textSize(12);  fill(100);
  text("Comparacion Tierra-Exoplaneta: tama\u00f1os y distancia a su sol.", p1_posX+10, p1_posY+16);
  //Tierra
  //sistema(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam)
//  sistema(60, "Tierra", 15, .1, "Nuestro Sol", 1.0);


}//fin panel1


public void panel2() {
  fill(0);
  rect(p2_posX, p2_posY, p2_w, p2_h);

  years(p2_posX, p1_posY + p1_h + p2_h);//anos abajo
}





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
      py = map(py_, 1.0f, 47.f, 270.0f, 500.f );//en relacion a la masa 
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
  public void rollover(float mx, float my) {
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
  public void display() {
    int colBall = color(200, 200, 0);
    fill(colBall, 150);
    ellipse(px, py, pradius, pradius);
    textSize(8);    text("- "+pdiscovered, px, py);

    sistema(60, "Tierra", 15, .1f, "Nuestro Sol", 1.0f);
    if (over) {
      colBall = color(250, 250, 0);
      sistema(130, "Exoplaneta: "+pname, 8500, .5f, "Estella "+data_s_name, 2.3f);
    }//end if


    if (pdiscovered == 2000) {
      colBall = color(250, 0, 0);
      stroke(200);
    }//end if
  }//End display




  // Display planet - - - - - - - - - - - - - - - - - - - - 
  public void cartelOver(int _posx, int _posy, String _pname) {//_esta es una var tempora q entra funciona en forma nada mas, tubo var temp 
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



  public void sistema(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam) {  
    int factorAmp = 50;
    //SOL
    float _sX = p1_w-100;//posicion del sol
    float _sY = p1_posY+ posY;
    String _sNom = p2_s_nomb;
    float _stam = p2_s_tam * factorAmp;
    //Planeta
    float _pDistance = map(p2_p_dist, 1.3f, 8500, 50, 800);//mapea distancia del planeta a su sol
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







  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#000000", "--hide-stop", "exoplanetas07" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
