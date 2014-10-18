//Ricardo Vega M. Exoplanets / Santiago de Chile, 2014
//desarrollado en el marco del proyecto AATS, Museo de Arte Contemporaneo, 
//name, mass, radius, date, star_name, ra(star?), distance?

//por ver
//planeta mas grande y pequen
//distancia del sol maxima y minima

//FONTS
PFont titFont;
PFont titFont2;
PImage img_bg;
//Tamanos y posiciones
int w = 1000;//1000, 1600, 1200
int h = 700;//700, 900, 675
//grillas
float grilla = w/20;//50 px
float grillita = grilla/5;//10 px
float borde = grillita*2;
float spacer_years;

//panel 1 - w, h, al, an.
float p1_w = w-borde*2;
float p1_h = grilla*3;//200-5 | float p1_h = grilla*4-grillita/2;//200-5
float p1_posX = borde;
float p1_posY = grilla+grillita;
float xr;

//panel 2 - w, h, al, an.
float p2_posX = borde;
float p2_posY = p1_posY + p1_h ;
float p2_w = w-borde*2;
float p2_h = grilla*10-grilla/2;//450-25

int anoInicio = 1995;
int anoFinal = 2014;
int cantidadYears = anoFinal-(anoInicio-1);//cantidad de anios a mostrar
int data_p_discovered; 
//21

//Colores; verde, rosado, celeste
color[] color_font = {  
  color(50, 255, 150), color(255, 100, 250), color(0, 235, 250)
}; 
//Colores; morado, azul, blanco
color[] color_bg = {  
  color(80, 0, 180), color(40, 60, 140), color(50, 255, 150)
}; 
color colBG = 240;


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
float data_p_temperature;

String data_s_name;  
float data_s_radius;
 

Planet[] planets;


void setup() {
  size(w, h);
  background(colBG);
  loadData();
  smooth();
  img_bg = loadImage("exoplanetas03_bg.jpg");
  titFont = loadFont("HermeneusOne-Regular-48.vlw");
  titFont2 = createFont("sans", 10);
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





void draw() {
  background(colBG);   
  image(img_bg, 0, 0);  
   
  // Display planets
  //  translate(borde, borde);//mueve todo
  //  fill(20, 20);
  tits();

  panel1();
  
  panel2();

  for (Planet p : planets) {  
    p.rollover(mouseX, mouseY);
    p.display();
  }//end for

  for (Planet p : planets) {  
    p.cartelOver(mouseX, mouseY, data_p_name);
    //    p.sistema(130, "Exoplaneta "+data_p_name, 8500, .5, "Estella "+data_s_name, 2.3);  
  }//end for

       //Tierra
  //sistema(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam)
    tierra(80, "Tierra", 15, .1, "Nuestro Sol", 1.0, color(150, 150, 255, 150) );

  panelInfo(w-borde, borde);   
     
}//end draw



