class Edge {
  PVector pos;
  float bigD;

  Edge(PVector pos, float d) {
    this.pos = pos;
    this.bigD = d;
  }

  Edge(float x, float y, float d) {
    this.pos = new PVector(x, y);
    this.bigD = d;
  }

  void show() {
    fill(255);
    ellipse(this.pos.x, this.pos.y, bigD, bigD);
    fill(0, 255, 0);
    if (isHovered(mouseX, mouseY)) {
      fill(255, 0, 0);
    }
    ellipse(this.pos.x, this.pos.y, bigD / 2, bigD / 2);
  }

  boolean isHovered(float x, float y) {
    return dist(x, y, pos.x, pos.y) < bigD;
  }

  void update() {
    if (mousePressed && isHovered(mouseX, mouseY)) {
      this.pos.x = mouseX;
      this.pos.y = mouseY;
    }
  }
}
