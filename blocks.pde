class block
{
  float x=width/2,
        y=height/4,
        dis=2,
        s=0.1;
  
  void run()
  {
    x+=dis*level;
    if(x>width-w || x<w)
    {
      dis=-dis;
    }
  }
  
  void show()
  {
    pushMatrix();
    translate(x,y,-d*5+d/2);
    rectMode(CENTER);
    shape(box);
    popMatrix();
  }
  
  void restart()
  {
    x=width/2;
    y=height/4;
    dis=5;
  }
  
  void down()
  {
    if(y<height-d*(num+0.5))
    {
      y+=5;
    }
    else
    {
      touch=false;
      if(abs(xp-x)>w/(4-level) & num>0)
      {
        box.setFill(color(255,0,0));
        wait=!wait;
      }
      else if(num==9)
      {
        translate(0,0);
        if(level<3)
        {
          level++;
          for(int i=0;i<=num;i++)
          {
            blocks[i].restart();
          }
          num=0;
        }
        else
        {
          over=true;
        }
      }
      else
      {
        if(num<9)
        {
          num++;
          xp=x;
        }
      }
    }
  }
}
