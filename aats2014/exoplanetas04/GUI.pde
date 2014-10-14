
void years(float x_, float y_){
  //bg years
   fill(50, 50);
   rect(x_, y_, p2_w, -20);  
   
   int cantidadYears = 21;//cantidad de anios a mostrar
   float spacer = p1_w/cantidadYears;

  for(int i=0; i<cantidadYears; i++){
   
   fill(color_font[2]);
   textAlign(LEFT); 
   textSize(12);
   text(1995+i, 5 + x_+spacer*i,  y_-4);//texto years

   stroke(0, 200, 0, 50);
   line(x_+spacer*i, y_-20,   x_+spacer*i,  y_-390);//
   noStroke();

 }

//texto datos eoplanetas abajo panel2
   fill(color_font[0]);
   textAlign(RIGHT); 
   textSize(12);
   text("Datos: exoplanets.org", p2_w,  y_+20);//texto years
   textAlign(LEFT); 

}//end years


void mousePosition(){
  fill(0);
  rect(mouseX-5, mouseY, 75, -15);
  fill(250); textSize(10);
  text("x: "+mouseX +" | y: "+mouseY, mouseX-5, mouseY-5);
}
