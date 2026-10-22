void setup() {
size(displayHeight, displayWidth);
background(255);
frameRate(10);
}
void draw() {
int numrects = 5;
float maxalpha = 30;

for (int i=0; i<numrects; i++) {
 float x = random(width);
 float y = random(height);
 float w = (x + y) / 5.0;
 float h = w;
 
 float r = x / 3.0;
 float g = y /4.0;
 float b = random(20, 30);
 float a = random(maxalpha);
 
 fill(r, g, b, a);
 noStroke();
 //strokeWeight(5);
 rect(x, y, w, h);
}
}
