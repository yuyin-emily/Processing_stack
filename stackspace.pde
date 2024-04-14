block[] blocks = new block[10];

PImage success;

PShape box,wall;

boolean touch=false,
        wait=false,
        over=false;

int num=0,
    time=0,
    level=1;

float w=250,
      h=50,
      d=50,
      l=height-d,
      xp=0;

void setup()
{
  size(900,900,P3D);
  surface.setLocation(987,50);
  box=createShape(BOX,w,h,d);
  wall=createShape(BOX,width,height,1);
  success=loadImage("success.png");
  for(int i=0;i<blocks.length;i++)
  {
    blocks[i] = new block();
  } 
}

void draw()
{
  background(127);
  
  if(over)
  {
    if (keyPressed & keyCode==ENTER)
    {
      over=!over;
      for(int i=0;i<=num;i++)
      {
        blocks[i].restart();
      }
      num=0;
      level=1;
    }
    image(success,0,0,width,height);
  }
  else
  {
    pushMatrix();
    translate(width/2,height/2,-d*5);
    rectMode(CENTER);
    wall.setFill(color(#C9DBFF));
    shape(wall);
    popMatrix();
    
    pushMatrix();
    translate(width/2,height,-d*5);
    rotateX(PI/2);
    rectMode(CENTER);
    wall.setFill(color(0));
    shape(wall);
    popMatrix();
    
    pushMatrix();
    translate(width,height/2,-d*5);
    rotateY(-PI/2);
    rectMode(CENTER);
    wall.setFill(color(255));
    shape(wall);
    popMatrix();
    
    pushMatrix();
    translate(0,height/2,-d*5);
    rotateY(PI/2);
    rectMode(CENTER);
    wall.setFill(color(255));
    shape(wall);
    popMatrix();
    
    for(int i=0;i<level;i++)
    {
      fill(0,255,0);
      circle(150+40*i,150,30);
    }
    if(wait)
    {
      time++;
      if(time>100)
      {
        time=0;
        wait=!wait;
        for(int i=0;i<=num;i++)
        {
          blocks[i].restart();
        }
        box.setFill(color(255,0,0));
        num=0;
      }
      if(num<10)
      {
        for(int i=0;i<=num;i++)
        {
          box.setFill(color(255,0,0));
          blocks[i].show();
        }
      }
    }
    else
    {
      if (keyPressed &!touch& keyCode==TAB)
      {
        touch=true;
      }
      if(touch)
      {
        blocks[num].down();
      }
      else
      {
        blocks[num].run();
      }
      if(num<10)
      {
        for(int i=0;i<=num;i++)
        {
          box.setFill(color(255*i/blocks.length,255*i/blocks.length,255,255));
          blocks[i].show();
        }
      }
    }
    
  }
}
