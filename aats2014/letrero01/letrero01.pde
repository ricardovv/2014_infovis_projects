// crear una forma que se mueva segun la pos X y posY


// hacer tres formas en una funcion void y luego llamarla en el draw
//mover en el draw esa forma desde la pta dl triangulo

int w=1000;
int h=7000;

void setup() {
  size(w, h);
}

void draw() {
  background( 255);
  noStroke();
  cartelOver(mouseX, mouseY, "aca van");// valor a las parametros de pos en el mismo orden
  //rect(width/2, height/2, 50, 50);
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

  fill(#A6F0F2);
  // triangle(0+_posx, 0+_posy, 30+_posx, 0+_posy, 30+_posx, 20+_posy);
  triangle(0, 0, -10, -10, 10, -10);

  rect (-anchoc/2+mov, -altoc -altot, anchoc, altoc);

  fill(#1E7476);
  rect (-anchoc/2+mov, -altoc -altot, anchoc, 20);

  fill(255);
  textSize(10);
  text("Titulo Nombre Planeta ", -anchoc/2+mov + septxt, -altoc + 3);

  fill(0);
  textSize(9);
  text(textos, -anchoc/2+mov + septxt, -altoc + septxt + 15);

  //resetMatrix();// no afecta al rect extra
}

// poner una var 

