Mirror m;
Stick s;
void setup() {
  size(600, 600);
  m = new Mirror(width/2, height/2, width/2);
  s = new Stick();
  frameRate(200);
}

void draw() {
  clear();
  background(0);
  m.show();
  s.showAndUpdate();
}
