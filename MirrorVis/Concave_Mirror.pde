class Mirror {
  float r;
  PVector pos;
  boolean showAxis = true;
  boolean showFocus = true;
  boolean showCenter = true;

  Mirror(PVector pos) {
    this.pos = pos;
  }

  Mirror(PVector pos, float r) {
    this.pos = pos;
    this.r = r;
  }

  Mirror(float x, float y) {
    this.pos = new PVector(x, y);
  }

  Mirror(float x, float y, float r) {
    this.pos = new PVector(x, y);
    this.r = r;
  }

  void setR(float r) {
    this.r = r;
  }

  void show() {
    stroke(255);
    strokeWeight(8);
    noFill();
    arc(this.pos.x, this.pos.y, this.r, this.r, -HALF_PI, HALF_PI);
    if (this.showFocus || this.showCenter) {
      fill(255);
      noStroke();
      //strokeWeight(8);
      if (this.showFocus) {
        ellipse(this.pos.x + r/4, this.pos.y, 4, 4);
      }
      if (this.showCenter) {
        ellipse(this.pos.x, this.pos.y, 4, 4);
      }
    }

    strokeWeight(1);
    if (showAxis) {
      stroke(255);
      line(0, this.pos.y, width, this.pos.y);
    }
  }

  void show(float start, float end) {
    stroke(255);
    strokeWeight(8);
    noFill();
    arc(this.pos.x, this.pos.y, this.r, this.r, start, end);
  }
}
