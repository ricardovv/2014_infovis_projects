void panel1() {
  fill(10);
  rect(p1_posX, p1_posY, p1_w, p1_h);

  //Tierra
  sistema(50, "Tierra", 100, .1, "Nuestro Sol", 1.0);

  //Exosistema
  sistema(125, "Exoplaneta X", 90, .5, "Otro Sol", 2.8);
}

void panel2() {
  fill(100, 100);
  rect(p2_posX, p2_posY, p2_w, p2_h);

  years(0, p1_posY + p1_h + p2_h);//anos abajo
}




// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void sistema(float posY,  String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam) {
  
  int factorAmp = 50;
  //SOL
  float _sX = p1_w-20;
  float _sY = p1_posY+ posY;
  String _sNom = p2_s_nomb;
  float _stam = p2_s_tam * factorAmp;
  //Planeta
  float _pX = p1_posX+150;
  float _pY = p1_posY+posY;
  String _pNom = p2_p_nomb;
  float _ptam = p2_p_tam * factorAmp;

  //linea distancia
  stroke(50); 
  line(_sX, _sY, _pX, _pY);
  noStroke();

  //sol
  fill(255, 255, 0, 150);
  ellipse(_sX, _sY, _stam, _stam); 
  fill(color_font[2]);
  textAlign(RIGHT); 
  textSize(10);
  text(_sNom, _sX-10, _sY+4);

  //tierra
  fill(255, 255, 0, 150);
  ellipse(_pX, _pY, _ptam, _ptam); 
  fill(color_font[2]);
  textAlign(LEFT); 
  text(_pNom, _pX-120, _sY+4);

  textAlign(LEFT);


}//end sistema

