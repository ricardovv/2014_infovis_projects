void panel1() {
  //BG 
  fill(10);
  rect(p1_posX, p1_posY, p1_w, p1_h-2);

  //Descripcion Panel 1
  textSize(10);  fill(color_font[0]);
  text("Comparacion Tierra-Exoplaneta: tamaños y distancia a su sol.", p1_posX+10, p1_posY+13);

}//fin panel1


void panel2() {
  fill(0);
  rect(p2_posX, p2_posY, p2_w, p2_h);

  //Descripcion Panel 1
  textSize(10);  fill(color_font[0]);
  text("Exoplanetas descubiertos por años y masa.", p2_posX+10, p2_posY+13);

  years(p2_posX, p1_posY + p1_h + p2_h);//anos abajo
}//end panel2





