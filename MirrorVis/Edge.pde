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
  
  /*
  @FIXME
  INPUT :this function should take all the edges as the input
  CONDITIONS :
    1. if the selected point is the this point itself, just ignore
    2. if the distance between the selected point and this point is less than the diametre,
       the edges are colliding.
       
       In this case, we should set the colliding edge back to its safe position (dist must be greater than bigD).
       Otherwise, the problem will be running as loop and the we'll be never be able to move the edges.
    3. the hardest one "^_/'w'\_^"
       Just update the edges :p
       
  OUTPUT : as it is a void function, this should return the whole universe
  */
  void update(Edge[] edges) {
    for (int i = 0; i < edges.length; i++) {
      float dists = this.pos.dist(edges[i].pos);
      if (dists <= 0.05) {
        // this is the edge itself :)
        continue;
      } else if (dists < bigD) {
        // 2 points are colliding
        float angle = PVector.sub(edges[i].pos, this.pos).heading();
        PVector tmp_vec = this.pos.copy();
        tmp_vec.setHeading(angle);
        tmp_vec.setMag(dists);
        tmp_vec.add(this.pos);
        edges[i].pos.set(tmp_vec);
      } else {
        update();
      }
    }
  }
  
  void update(float x, float y) {
    this.pos.set(x, y);
  }
}
