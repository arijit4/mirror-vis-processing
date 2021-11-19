class Ray {
  Mirror m;
  PVector start;
  PVector reflectionPoint;
  PVector endPoint;
  
  Ray(float x, float y) {
    start = new PVector(x, y);
    reflectionPoint = new PVector(x, y);
    endPoint = new PVector(x, y);
  }
  
  Ray(PVector start) {
    this.start = start;
  }
  
  void setReflectionPoint(PVector rp) {
    this.reflectionPoint = rp;
    this.endPoint = rp;
  }
  
  void setEndPoint(PVector ep) {
    this.endPoint = PVector.add(ep, reflectionPoint);
  }
  
  void castLine() {
    line(start.x, start.y, reflectionPoint.x, reflectionPoint.y);
    line(reflectionPoint.x, reflectionPoint.y, endPoint.x, endPoint.y);
  }
}
