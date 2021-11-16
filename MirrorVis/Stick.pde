class Stick {
  Edge[] edges = new Edge[2];

  Stick() {
    edges[0] = new Edge(width/2, height/2 - 20, 10);
    edges[1] = new Edge(width/2, height/2 + 20, 10);
  }

  Stick(PVector a, PVector b) {
    edges[0] = new Edge(a.x, a.y, 10);
    edges[1] = new Edge(b.x, b.y, 10);
  }
  
  void show() {
    strokeWeight(8);
    line(edges[0].pos.x, edges[0].pos.y, edges[1].pos.x, edges[1].pos.y);
    edges[0].show();
    edges[1].show();
  }
  
  void update() {
    edges[0].update();
    edges[1].update();
  }
  
  void showAndUpdate() {
    strokeWeight(8);
    line(edges[0].pos.x, edges[0].pos.y, edges[1].pos.x, edges[1].pos.y);
    edges[0].show();
    edges[1].show();
    
    edges[0].update();
    edges[1].update();
  }
}
