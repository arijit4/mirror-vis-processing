class Edge {
  PVector pos;
  float bigR;
  
  Edge(PVector pos, float r) {
    this.pos = pos;
    this.bigR = r;
  }
  
  Edge(float x, float y, float r) {
    this.pos = new PVector(x, y);
    this.bigR = r;
  }
  
  void show() {
    fill(255);
    ellipse(this.pos.x, this.pos.y, bigR, bigR);
    fill(0, 255, 0);
    if (isHovered(mouseX, mouseY)) {
      fill(255, 0, 0);
    }
    ellipse(this.pos.x, this.pos.y, bigR/2, bigR/2);    
  }
  
  boolean isHovered(float x, float y) {
    return dist(x, y, pos.x, pos.y) < bigR;
  }
  
  void update() {
    if (mousePressed && isHovered(mouseX, mouseY)) {
      this.pos.x = mouseX;
      this.pos.y = mouseY;
    }
  }
}
