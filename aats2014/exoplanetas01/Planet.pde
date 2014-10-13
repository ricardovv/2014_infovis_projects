// A Bubble class, reference from DShiffman LoadSaveTable. 

class Bubble {
  float x,y;
  float diameter;
  String name;
  
  boolean over = false;
  
  // Create  the Bubble
  Bubble(float x_, float y_, float diameter_, String s) {
    x = x_;
    y = y_;
    diameter = diameter_;
    name = s;
  }
  
  // CHecking if mouse is over the Bubble
  void rollover(float px, float py) {
    float d = dist(px,py,x,y);
    if (d < diameter/2) {
      over = true; 
    } else {
      over = false;
    }
  }
  
  // Display the Bubble
  void display() {
    int col = 0;

    if (over) {
      col = 200;
      fill(20);
      textAlign(CENTER);
      text(name,x,y+diameter/2+20);
    }
    
        stroke(0);
    strokeWeight(2);
    fill(col);
    ellipse(x,y,diameter,diameter);

    
  }
}
