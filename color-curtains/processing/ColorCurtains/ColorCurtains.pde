// Adapted from Carl's moving_squares.pde; original preserved in ../../original.
// Five new translucent rectangles at 10 Hz; background is cleared only on reset.
// Changes: full-height narrow rectangles and a cyan-to-pink positional palette.
// Space: pause. R: reset. Arrows: rate / width. S: save frame.
float speed=1, density=1, elapsed=0;
int previous;
boolean paused=false;
void setup(){
  size(960,560);frameRate(30);noStroke();background(255);previous=millis();
}
void draw(){
  int now=millis();float dt=min(now-previous,100)/1000.0;previous=now;
  if(paused)return;
  elapsed+=dt*speed;
  while(elapsed>=0.1){elapsed-=0.1;for(int i=0;i<5;i++)addRectangle();}
}
void addRectangle(){
  float x=random(1), w=(0.002+random(0.058))/density;
  float warm=constrain((x-0.42)/0.48,0,1);
  float r=lerp(5,245,warm)+random(10);
  float g=lerp(175,115,warm)+random(90);
  float b=210+random(45), a=random(30);
  fill(r,g,b,a);rect(x*width,0,w*width,height);
}
void keyPressed(){
  if(key==' ')paused=!paused;
  if(key=='r'||key=='R'){background(255);elapsed=0;}
  if(key=='s'||key=='S')saveFrame("curtains-####.png");
  if(keyCode==UP)speed=min(2,speed+0.05);
  if(keyCode==DOWN)speed=max(0,speed-0.05);
  if(keyCode==RIGHT)density=min(2,density+0.05);
  if(keyCode==LEFT)density=max(0.5,density-0.05);
}
