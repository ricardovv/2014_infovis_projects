//Ricardo Vega M. Exoplanets / Santiago de Chile, 2014
//desarrollado en el marco del proyecto AATS, Museo de Arte Contemporaneo, 
//name, mass, radius, date, star_name, ra(star?), distance?
Table losDatos;//new table to load data
int totalDatosRows; //para tener el total de rows de datos


int w = 1000;
int h = 1500;

void setup(){
  size(w, h);
 
 }

void draw(){
  background(20);
  translate(0, -mouseY*8);//desplaza la magen hacia arriba apra verlos

  loadData();

 
}//end draw



   
