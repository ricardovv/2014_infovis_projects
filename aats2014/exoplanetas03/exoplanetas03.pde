//Ricardo Vega M. Exoplanets / Santiago de Chile, 2014
//desarrollado en el marco del proyecto AATS, Museo de Arte Contemporaneo, 
//name, mass, radius, date, star_name, ra(star?), distance?

//por ver
//planeta mas grande y pequen
//distancia del sol maxima y minima

PImage boceto;
boolean onBoceto;

int w = 1000;
int h = 1500;
int borde = 20;

Table losDatos;//new table to load data
int totalDatosRows; //para tener el total de rows de datos
float minYear = 0;
float maxYear = 0;
int panel1_w = w-borde*2;
int panel1_h = h-borde*50;


Planet[] planets;

color colBG = 240;



void setup() {
  size(w, h);
  background(colBG);
  loadData();
  smooth();
  boceto = loadImage("exoplanetas02.jpg"); 
}//emd setup



void draw() {
  background(colBG);
  // Display planets
  translate(borde, borde);//mueve todo
  fill(20, 20);
  rect(0, 0, panel1_w, panel1_h);

  for (Planet p : planets) {  
    p.display();
    p.detail();
    p.rollover(mouseX, mouseY);
  }//end for

  years(borde, panel1_h);//anos abajo

if(onBoceto){
  image(boceto, -borde, -borde);  
}

}//end draw

//carga imagen boceto
void keyPressed(){
onBoceto = !onBoceto;
}


