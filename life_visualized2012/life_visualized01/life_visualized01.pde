PFont tit, yearsTit; // variable for text tits
int[] altura1 = {
  20, 18, 12, 2, 15, 14, 12, 9, 10, 6, 5, 9, 8, 10, 16, 4, 6, 4, 7, 8, 10, 9, 4, 2, 8, 12, 8, 7, 6, 4, 5, 8, 12, 10, 12, 9, 10, 9, 9, 5, 6, 7, 7, 3
};
int[] altura2 = {
  19, 18, 16, 12, 18, 15, 12, 9, 7, 14, 8, 9, 6, 7, 12, 9, 11, 8, 7, 7, 8, 6, 6, 8, 6, 6, 6, 5, 3, 1, 1, 5, 6, 8, 7, 6, 6, 7, 6, 5, 8, 8, 8, 8
};
int[] altura3 = {
  19, 18, 16, 7, 16, 16, 16, 16, 18, 9, 9, 11, 12, 16, 19, 7, 15, 13, 9, 8, 9, 8, 10, 6, 13, 12, 11, 9, 9, 8, 9, 5, 6, 7, 7, 6, 5, 2, 3, 3, 6, 6, 5, 5
};

int[] years = {
  1969, 1970, 1975, 1980, 1985, 1990, 1995, 2000, 2005, 2010
};
int w = 1200; // width elements
int h = 800; // height elements
int dist_lado = 50; // distance from borders 
int dist_lado_b = dist_lado/2; // dist_lado_b distance from border 
color col; // color value
int factorAltura = 15;
int wCuarto = w/4; 
int w2 = w/2 ; // total with minus distance from border
int h2 = h/2;  // total height minus distance from border

float x = 0;

void setup() {
  size(w, h);
  colorMode(HSB, 360, 100, 100);
  smooth();
}


void draw() {
  background(45, 0, 100);


  //  pushMatrix();  
  translate(dist_lado_b, dist_lado_b); 
  for (int i=0; i < altura1.length; i++) {
    int resto = (height-dist_lado)/altura1.length; // Widht total / quantity of data

    // DRAW BACKGROUND LINES
    stroke(0, 0, 40);
    line(0, resto*i, width-dist_lado, resto*i);
    noStroke();

    //COLORS
    float colRed = map(altura1[i], min(altura1), max(altura1), 0, 2); // 240 250map for bar colors
    float colBlue = map(altura2[i], min(altura2), max(altura2), 120, 122); // 120 130 map for bar colors
    float colYellow = map(altura3[i], min(altura3), max(altura3), 210, 212); // 60 70map for bar colors

    // BLOCKS 1     //    rect(resto*i, h2, resto, altura1[i]); // draw the blocks
    rectMode(CENTER);    //    
    // RED BARS  
    fill(colRed, 100, 100); // bars color YELLOW 

    float wrec = altura1[i]*factorAltura; 

    x = lerp(x, wrec, 0.99);

    rect(wCuarto, resto*i, x, resto+1 ); // draw the blocks
    //    ellipse(wCuarto+100, resto*i, altura1[i], altura1[i] ); // draw the blocks

    


    // BLUE BARS  
    fill(colBlue, 100, 100); // bars color YELLOW  
    rect(wCuarto*2, resto*i, altura2[i]*factorAltura, resto+1 ); // draw the blocks
    ellipse(wCuarto-100, resto*i, altura2[i], altura2[i] ); // draw the blocks

    // GREEN BARS  
    fill(colYellow, 100, 100); // bars color YELLOW  
    rect(wCuarto*3, resto*i, altura3[i]*factorAltura, resto+1 ); // draw the blocks
  }
  //  popMatrix();
}





void keyPressed() {
  //  saveFrame();
}

