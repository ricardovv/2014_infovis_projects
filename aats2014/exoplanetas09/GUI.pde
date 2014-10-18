
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
   line(x_+spacer_years*i, y_,    x_+spacer_years*i,  y_-p2_h+borde);//
   noStroke();
 }

}//end years



void tits(){
  //tits
  textFont(titFont); textSize(30);  fill(color_font[0]);
  text("Exoplanetas", p1_posX, borde*2);
  textFont(titFont2); textSize(12);  fill(color_font[1]);
  text("Planetas fuera del sistema solar descubiertos desde 1995", w/5, borde*2);

  //texto datos eoplanetas abajo panel2
   fill(color_font[0]);
   textAlign(RIGHT); 
   textSize(12);
   text("Datos: exoplanets.org", w-borde*3,  borde*2);//texto years
   textAlign(LEFT); 
}



void mousePosition(){
  fill(0);
  rect(mouseX-5, mouseY, 75, -15);
  fill(250); textSize(10);
  text("x: "+mouseX +" | y: "+mouseY, mouseX-5, mouseY-5);
}



void tierra(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam, color sistemColor) {  
  int factorAmp = 25;
  //Planeta
  float _pDistance = map(p2_p_dist, 1.3, 8500, 50, 800);//mapea distancia del planeta a su sol
  float _pX = p1_posX+100;
  //float _pX = _sX-_pDistance;/// pos del planeta menos distancia al sol
  float _pY = p1_posY+posY;
  String _pNom = p2_p_nomb;
  float _ptam = p2_p_tam * factorAmp;
  int txtY = -30;

  //SOL
  float _sX = p1_w-100;//posicion del sol
  float _sY = p1_posY+ posY;
  String _sNom = p2_s_nomb;
  float _stam = p2_s_tam * factorAmp;
  

    
  //linea distancia
  stroke(50); 
  line(_sX, _sY, _pX, _pY);
  noStroke();

  //sol
  fill(sistemColor);
  ellipse(_sX, _sY, _stam, _stam); 
  fill(color_font[2]);
  textAlign(CENTER); 
  textSize(10);
  text(_sNom, _sX, _sY+txtY);

  //Planeta
  fill(sistemColor);
  ellipse(_pX, _pY, _ptam, _ptam); 
  fill(color_font[2]);
  textAlign(CENTER); 
  text(_pNom, _pX, _sY+txtY);

  textAlign(LEFT);
}//end sistema





