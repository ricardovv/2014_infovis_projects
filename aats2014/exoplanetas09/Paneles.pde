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




// hacer clases botones panel

//TEXT BOX FOR INFO
void panelInfo(float _infox, float _infoy) {
  float infoW = 250;
  float infoH = 400;
  float infoX = _infox-infoW;
  float infoY = _infoy;
  String panelInfo1 = "Este es el texto de informacion";
  String panelInfo2 = "Este es el texto de informacion2";
  String panelInfo3 = "Este es el texto de informacion3";
  noStroke();  
 
  //sans font w createFont
  textFont(titFont2);
  
  //CAJA BG TRANSPARENT
  fill(color_bg[0]);//COLOR BG TEXT
  rect(infoX, infoY, infoW, infoH );
  
  //BG IMAGE OR DESIGN?
    fill(0, 0, 250);
    noStroke();  
   
    //TEXT
    float textPosX = infoX+20;
    float textPosY = infoY + grilla*2;//position of texts
    int textW = 500;
     fill(200);
    textFont(titFont2);
    textAlign(LEFT);
    textSize(20);
    text("ABOUT THE PROJECT\n", textPosX, textPosY-10, textW, 400);  
    textSize(14);
    text("MOTIVATION\n" + panelInfo1, textPosX, textPosY+grilla*3, textW, 400);
    text("CREDITS & SOURCES\n" + panelInfo2, textPosX, textPosY+grilla*9, textW, 400);
    text("ACKNOWLEDGMENTS\n" + panelInfo3, textPosX, textPosY+grilla*15, textW, 400);
  
   //TEXT PANET UP AND DOWN
  //butCircleCloseTextInfo.display(panelInfoY, "info");

}

