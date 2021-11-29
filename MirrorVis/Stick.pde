class Stick {
  Edge[] edges = new Edge[3];

  Stick() {
    edges[0] = new Edge(width/2, height/2 - 20, 10);
    edges[1] = new Edge(width/2, height/2 + 20, 10);

    edges[2] = new Edge((edges[0].pos.x + edges[1].pos.x) / 2, (edges[0].pos.y + edges[1].pos.y) / 2, 10);
  }

  Stick(PVector a, PVector b) {
    edges[0] = new Edge(a.x, a.y, 10);
    edges[1] = new Edge(b.x, b.y, 10);

    edges[2] = new Edge((a.x + b.x) / 2, (a.y + b.y) / 2, 10);
  }

  void show() {
    line(edges[0].pos.x, edges[0].pos.y, edges[1].pos.x, edges[1].pos.y);
    edges[0].show();
    edges[1].show();
    edges[2].show();
  }

  void update() {
    edges[0].update();
    edges[1].update();

    edges[2].update((edges[0].pos.x + edges[1].pos.x) / 2, (edges[0].pos.y + edges[1].pos.y) / 2);
  }

  void showAndUpdate() {
    line(edges[0].pos.x, edges[0].pos.y, edges[1].pos.x, edges[1].pos.y);

    this.show();
    this.update();
  }
}
