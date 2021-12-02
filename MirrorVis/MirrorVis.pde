Mirror mirror;
Stick stick;

void setup() {
  size(600, 600);
  mirror = new Mirror(width);
  stick = new Stick(mirror, mirror.FOCUS);
  stroke(255);

  frameRate(200);
}

void draw() {
  clear();
  background(0);
  stick.showAndUpdate();
  mirror.show();
  mirror.reflect(stick.edges);
}
