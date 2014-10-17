void panel1() {
  //BG 
  fill(10);
  rect(p1_posX, p1_posY, p1_w, p1_h-5);
  //Descripcion Panel 1
  textSize(12);  fill(100);
  text("Comparacion Tierra-Exoplaneta: tamaños y distancia a su sol.", p1_posX+10, p1_posY+16);
  //Tierra
  //sistema(float posY, String p2_p_nomb, float p2_p_dist, float p2_p_tam, String p2_s_nomb, float p2_s_tam)
//  sistema(60, "Tierra", 15, .1, "Nuestro Sol", 1.0);


}//fin panel1


void panel2() {
  fill(0);
  rect(p2_posX, p2_posY, p2_w, p2_h);

  years(p2_posX, p1_posY + p1_h + p2_h);//anos abajo
}





