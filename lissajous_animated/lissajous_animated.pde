// change these
int freqX = 10;
int freqY = 10;
int modx = 19;
int mody = 20;

void setup() {
  size(640, 640);
  colorMode(HSB, 360, 100, 100, 1);
  noFill();
}

void addVert(float i) {
  curveVertex(
    sin(i * freqX + radians(frameCount*4)) * cos(i * modx) * width/2,
    sin(i * freqY) * cos(i * mody) * height/2
  );
}

void draw() {
  background(0,0,100);
  
  translate(width / 2, height / 2);  
  beginShape();
  float i = 0;
  addVert(i); // control point
  for (i = 0; i < TWO_PI; i += TWO_PI / 360) addVert(i); // anchor points
  addVert(i); // control point
  endShape();

  saveFrame("output/frame-###.png");
  if(frameCount==90) exit();
}
