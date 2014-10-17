
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




void cartelOver(int _posx, int _posy, String textos) {//_esta es una var tempora q entra funciona en forma nada mas, tubo var temp 

  int anchoc = 160;
  int altoc = 80;
  int septxt = 5;
  int altot = 10;
  int mov = 40;

  if (_posx >= w-140) {
    mov = -40;
  }
  noStroke();
  translate(_posx, _posy);// otra opcion antes q nada para todas las formas

  fill(color_bg[1]);
  // triangle(0+_posx, 0+_posy, 30+_posx, 0+_posy, 30+_posx, 20+_posy);
  triangle(0, -5, -5, -10, 5, -10);

  rect (-anchoc/2+mov, -altoc -altot, anchoc, altoc);

  fill(color_bg[0]);
  rect (-anchoc/2+mov, -altoc -altot, anchoc, 20);

  fill(color_bg[2]);
  textSize(10);
  text("Titulo Nombre Planeta ", -anchoc/2+mov + septxt, -altoc + 3);

  textSize(9);
  text(textos, -anchoc/2+mov + septxt, -altoc + septxt + 15);

  resetMatrix();// no afecta al rect extra

}//cartelOver 



