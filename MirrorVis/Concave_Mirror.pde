class Mirror {
  float d;
  PVector pos;
  PVector mainFocus;
  boolean showAxis = true;
  boolean showFocus = true;
  boolean showCenter = true;
  
  String CENTER = "center";
  String FOCUS = "focus";

  color[] ray_colors = {#FCF108, #E85E02, #980B75};

  Mirror(PVector pos) {
    this.pos = pos;
  }

  Mirror(PVector pos, float d) {
    this.pos = pos;
    this.mainFocus = new PVector(pos.x + d/4, pos.y);
    this.d = d;
  }

  Mirror(float d) {
    float x = max((width - d/2) / 2, 0);
    this.pos = new PVector(x, height/2);
    this.setD(d);
  }

  Mirror(float x, float y) {
    this.pos = new PVector(x, y);
  }

  Mirror(float x, float y, float d) {
    this.pos = new PVector(x, y);
    this.mainFocus = new PVector(this.pos.x + d/4, pos.y);
    this.d = d;
  }

  void setD(float d) {
    this.d = d;
    this.mainFocus = new PVector(this.pos.x + d/4, pos.y);
  }

  void show() {
    stroke(255);
    noFill();
    arc(this.pos.x, this.pos.y, this.d, this.d, -HALF_PI, HALF_PI);
    if (this.showFocus || this.showCenter) {
      fill(255);
      if (this.showFocus) {
        ellipse(this.pos.x + d/4, this.pos.y, 4, 4);
      }
      if (this.showCenter) {
        ellipse(this.pos.x, this.pos.y, 4, 4);
      }
    }

    if (showAxis) {
      stroke(255);
      line(0, this.pos.y, width, this.pos.y);
    }
  }

  void show(float start, float end) {
    stroke(255);
    noFill();
    arc(this.pos.x, this.pos.y, this.d, this.d, start, end);
  }

  void reflect(Edge[] edges) {
    for (int i = 0; i < edges.length; i++) {
      stroke(ray_colors[i]);
      Ray ray = new Ray(edges[i].pos);
      // Parallel ray
      float y = this.pos.y - ray.start.y;
      float theta = asin(y/(this.d/2));
      float x = cos(theta) * (this.d/2);
      x += this.pos.x;
      y = this.pos.y - y;
      // x is `NaN` when the ray doesn't meet the mirror.

      ray.setReflectionPoint(new PVector(x, y));
      PVector reflectionDir = PVector.sub(this.mainFocus, ray.reflectionPoint).mult(100);
      ray.setEndPoint(reflectionDir);
      ray.castLine();

      // toward the pole
      if (str(x) != "NaN") {
        Ray poleRay = ray;
        poleRay.setReflectionPoint(new PVector(pos.x + d/2, pos.y));
        PVector rDir = PVector.sub(poleRay.reflectionPoint, poleRay.start).mult(100);
        rDir.x *= -1;
        poleRay.setEndPoint(rDir);
        poleRay.castLine();
      }
    }
  }
}
