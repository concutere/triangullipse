float x, y, w, rr, sinRad60;
int factor = 1;
float xo, yo;
int opq = 22;
int spin = 1;
int r;

void setup()
{
  frameRate(24);
  size(1200, 600);
  background(0);
  noStroke();
  smooth();

  x = width/2;
  y = height/2 + height/8;
  w = min(width/2, height/2);
  r = 0;
  sinRad60 = sin(radians(60));

  //these modify the translation in triDots()
  //need to make a loop of these every r%360 in draw()
  xo = 0; //x; //x/2; //0;
  yo = 0; //y; //y/2; //0;

  //triDots(x,y,w);

  //up
  //triangle(-d2, h3, 0, h3-h, d2, h3);
  //down
  //triangle(-d2,-h3, 0,h-h3, d2, -h3);

  //opq = 1; //effect seems to fade past ~32 layers for opq = 1
  //frameRate(15);
}

void draw()
{
  background(0);
  r = r + spin;
  rr = abs(radians(r % 360));
  quadDots(x, y, w, rr);
  if (rr < PI)
    xo = yo = rr / PI;
  else if (rr < TWO_PI)
    xo = yo = 2 - rr / PI;
  if (rr % TWO_PI == 0)
  {
    //spin *= -1;
    factor *= -1;
  }
}

void triDots(float x, float y, float w, float r)
{
  float diam, d2, h, h3, h2, w2;

  diam = w;
  d2 = diam/2;
  w2 = diam+d2;

  h = sinRad60 * diam;
  h3 = h/3;
  h2 = h/2;

  pushMatrix();
  translate(x, y);
  rotate(r);
  fill(255, 0, 127, opq);
  ellipse(-d2, h3, w2, w2);

  fill(0, 255, 0, opq);
  ellipse(0, h3-h, w2, w2);

  fill(127, 0, 255, opq);
  ellipse(d2, h3, w2, w2);

  if (diam > 5)
  {
    float rf = r*factor;
    float xx = x * xo;
    float yy = y * yo;
    triDots(xx-d2, yy+h3, d2, rf);
    triDots(xx, yy+h3-h, d2, rf);
    triDots(xx+d2, yy+h3, d2, rf);
  }
  popMatrix();
}

void quadDots(float x, float y, float w, float r)
{
  float diam, d2, h, h3, h2, w2;

  diam = w;
  d2 = diam/2;
  w2 = diam+d2;

  h = sinRad60 * diam;
  h3 = h/3;
  h2 = h/2;

  pushMatrix();
  translate(x, y);
  rotate(r);
  fill(255, 0, 127, opq);
  ellipse(-w2, -w2, w2, w2);

  fill(0, 255, 0, opq);
  ellipse(-w2, w2, w2, w2);

  fill(127, 0, 255, opq);
  ellipse(w2, -w2, w2, w2);

  fill(255, opq);
  ellipse(w2, w2, w2, w2);

  if (diam > 5)
  {
    float rf = r*factor;
    float xx = x * xo;
    float yy = y * yo;
    quadDots(xx, yy, d2, rf);
    quadDots(xx+w2, yy, d2, rf);
    quadDots(xx, yy+w2, d2, rf);
    quadDots(xx+w2, yy+w2, d2, rf);
  }
  popMatrix();
}

void quintDots(float x, float y, float w, float r)
{
  float diam, d2, w2;

  diam = w;
  d2 = diam/2;
  w2 = diam+d2;

  pushMatrix();
  translate(x, y);
  rotate(r);
  
  fill(255, 0, 127, opq);
  ellipse(-w2, -w2, w2, w2);

  fill(0, 255, 0, opq);
  ellipse(-w2, w2, w2, w2);

  fill(127, 0, 255, opq);
  ellipse(w2, -w2, w2, w2);

  fill(255, opq);
  ellipse(w2, w2, w2, w2);

  if (diam > 5)
  {
    float rf = r*factor;
    float xx = x * xo;
    float yy = y * yo;
    quintDots(xx, yy, d2, rf);
    quintDots(xx+w2, yy, d2, rf);
    quintDots(xx, yy+w2, d2, rf);
    quintDots(xx+w2, yy+w2, d2, rf);
    quintDots(xx+w2, yy+w2, d2, rf);
  }
  popMatrix();
}
