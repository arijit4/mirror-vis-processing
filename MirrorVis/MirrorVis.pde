Mirror m;
Stick s;

void setup() {
  size(600, 600);
  m = new Mirror(width/2, height/2, width/2);
  s = new Stick();
  stroke(255);

  frameRate(200);
  
}

void draw() {
  clear();
  background(0);
  s.showAndUpdate();
  m.show();
  m.reflect(s.edges);
}
