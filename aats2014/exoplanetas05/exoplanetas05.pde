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
float p2_w = w-borde*2;
float p2_h = grilla*8-grillita/2;//400-5
float p2_posX = borde;
float p2_posY = p1_posY + p1_h + 5;
int anoInicio = 1989;
int anoFinal = 2015;
int cantidadYears = anoFinal-anoInicio;//cantidad de anios a mostrar
int data_p_discovered; 
//21

//Colores; verde, rosado, celeste
color[] color_font = {  color(50, 255, 150), color(255, 100, 250), color(0, 235, 250) }; 
//Colores; morado, azul, blanco
color[] color_bg = {  color(100, 0, 200), color(80, 100, 180), color(50, 255, 150) }; 
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
String data_s_name;  
Boolean planetOver;

Planet[] planets;





void setup() {
  size(w, h);
  background(colBG);
  loadData();
  smooth();
  boceto = loadImage("exoplanetas03.jpg"); 
  img_bg = loadImage("exoplanetas03_bg.jpg");
  titFont = loadFont("HermeneusOne-Regular-48.vlw");
  planetOver = false; 

 for (Planet p : planets) {  
    p.display();
    p.detail();
    p.rollover(mouseX, mouseY);
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
    p.detail();
    p.rollover(mouseX, mouseY);
  }//end for

  if(planetOver == true){
  }

  resetMatrix();
}//end draw




//carga imagen boceto
void keyPressed() {
  onBoceto = !onBoceto;
}


