
void years(float x_, float y_){
   float spacer = p1_w/cantidadYears;
  //bg years
   fill(50, 150);
   rect(x_+borde, y_, p2_w, -20);  

  
  for(int i=0; i<cantidadYears; i++){   
   fill(color_font[2]);
   textAlign(LEFT); 
   textSize(10);
   text(anoInicio+i, borde+5 + x_+spacer*i,  y_-4);//texto years

   stroke(0, 200, 0, 50);
   line(borde+x_+spacer*i, y_-20,   borde+x_+spacer*i,  y_-390);//
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







