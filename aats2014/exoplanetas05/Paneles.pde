void panel1() {
  //BG 
  fill(10);
  rect(p1_posX, p1_posY, p1_w, p1_h);
  //Descripcion Panel 1
  textSize(12);  fill(100);
  text("Comparacion Tierra-Exoplaneta: tamaños y distancia a su sol.", p1_posX+10, p1_posY+16);

  //Tierra
  //sistema(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam)
  sistema(60, "Tierra", 15, .1, "Nuestro Sol", 1.0);

  if(planetOver){
    //Exosistema
    //    sistema(130, "Exoplaneta "+data_p_name, 8500, .5, "Estella "+data_s_name, 2.3);
    sistema(130, "Exoplaneta "+data_p_name, 8500, .5, "Estella "+data_s_name, 2.3);
  }
  
  println(planetOver);

}//fin panel1


void panel2() {
  fill(0);
  rect(p2_posX, p2_posY, p2_w, p2_h);

  years(0, p1_posY + p1_h + p2_h);//anos abajo
}




// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void sistema(float posY,  String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam) {  
  int factorAmp = 50;
  //SOL
  float _sX = p1_w-100;//posicion del sol
  float _sY = p1_posY+ posY;
  String _sNom = p2_s_nomb;
  float _stam = p2_s_tam * factorAmp;
  //Planeta
  float _pDistance = map(p2_p_dist, 1.3, 8500, 50, 800);//mapea distancia del planeta a su sol
  float _pX = p1_posX+100;
  //float _pX = _sX-_pDistance;/// pos del planeta menos distancia al sol
  float _pY = p1_posY+posY;
  String _pNom = p2_p_nomb;
  float _ptam = p2_p_tam * factorAmp;

  //linea distancia
  stroke(50); 
  line(_sX, _sY, _pX, _pY);
  noStroke();

  //sol
  fill(255, 255, 0, 75);
  ellipse(_sX, _sY, _stam, _stam); 
  fill(color_font[2]);
  textAlign(CENTER); 
  textSize(10);
  text(_sNom, _sX, _sY-10);

  //Planeta
  fill(255, 255, 0, 75);
  ellipse(_pX, _pY, _ptam, _ptam); 
  fill(color_font[2]);
  textAlign(CENTER); 
  text(_pNom, _pX, _sY-10);

  textAlign(LEFT);


}//end sistema

