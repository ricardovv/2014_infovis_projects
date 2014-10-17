
void years(float x_, float y_){
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





void dataSource(){
   //texto datos eoplanetas abajo panel2
   fill(color_font[0]);
   textAlign(RIGHT); 
   textSize(12);
   text("Datos: exoplanets.org", w-borde*3,  borde*2.5);//texto years
   textAlign(LEFT); 
}



void mousePosition(){
  fill(0);
  rect(mouseX-5, mouseY, 75, -15);
  fill(250); textSize(10);
  text("x: "+mouseX +" | y: "+mouseY, mouseX-5, mouseY-5);
}







