
void setup()
{
  size(600,600);
  background(0);
  noStroke();
  smooth();
  
  float x, y, w;
  x = width/2;
  y = height/2 + height/8;
  w = min(width/2,height/2);
  triDots(x,y,w);

  //up
  //triangle(-d2, h3, 0, h3-h, d2, h3);
  //down
  //triangle(-d2,-h3, 0,h-h3, d2, -h3);

//opq = 1; //effect seems to fade past ~32 layers for opq = 1
//frameRate(15);
}

void triDots(float x, float y, float w)
{
  float diam, d2, h, h3, h2;
  int opq = 22;

  diam = w;
  d2 = diam/2;
    
  h = sin(radians(60)) * diam;
  h3 = h/3;
  h2 = h/2;
  //translate(x,y);
  //if (reps < 25) reps++;
  fill(255,0,0,opq);
  ellipse(x-d2,y+h3,diam+d2,diam+d2);
  
  fill(0,255,0,opq);
  ellipse(x,y+h3-h,diam+d2,diam+d2);
  
  fill(0,0,255,opq);
  ellipse(x+d2, y+h3, diam+d2, diam+d2);

  if (diam > 5)
  {
    triDots(x-d2,y+h3,d2);
    triDots(x,y+h3-h,d2);
    triDots(x+d2,y+h3,d2);
  }
}
