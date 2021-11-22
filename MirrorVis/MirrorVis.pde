Mirror mirror;
Stick stick;

void setup() {
  size(600, 600);
  mirror = new Mirror(width/2, height/2, width/2);
  stick = new Stick();
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
