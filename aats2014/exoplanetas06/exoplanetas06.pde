//Ricardo Vega M. Exoplanets / Santiago de Chile, 2014
//desarrollado en el marco del proyecto AATS, Museo de Arte Contemporaneo, 
//name, mass, radius, date, star_name, ra(star?), distance?

//por ver
//planeta mas grande y pequen
//distancia del sol maxima y minima
PImage boceto;
PImage img_bg;
boolean onBoceto;

//FONTS
PFont titFont;

//Tamanos y posiciones
int w = 1000;
int h = 700;
//grillas
float grilla = w/20;//50 px
float grillita = grilla/5;//10 px
float borde = grillita*2;

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
color[] color_font = {  color(50, 255, 150), color(255, 100, 250), color(0, 235, 250) }; 
//Colores; morado, azul, blanco
color[] color_bg = {  color(100, 0, 200), color(60, 80, 160), color(50, 255, 150) }; 
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

String data_s_name;  
 
Planet[] planets;





void setup() {
  size(w, h);
  background(colBG);
  loadData();
  smooth();
  boceto = loadImage("exoplanetas03.jpg"); 
  img_bg = loadImage("exoplanetas03_bg.jpg");
  titFont = loadFont("HermeneusOne-Regular-48.vlw");

  for (Planet p : planets) {  
    p.display();
    p.rollover(mouseX, mouseY);
    p.cartelOver(mouseX, mouseY, data_p_name);
  }//end for

}//emd setup





void draw() {
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


println(totalDatosRows);
}//end draw




//carga imagen boceto
void keyPressed() {
  onBoceto = !onBoceto;
}


