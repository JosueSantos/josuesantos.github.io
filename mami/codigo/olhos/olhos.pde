PImage i;
void setup(){
  size(600,600);
  imageMode(CENTER);
  i = loadImage("images.JPG");
}

float t, x, y, t2,ang;
void draw(){
  background(128);
  image(i, 315, 320, 200, 200);
  fill(255);
  ellipse(width/2, height/2,30,30);
  ellipse(width/2+30, height/2,30,30);
  
  x = mouseX - width/2;
  y = mouseY - height/2;
  
  t2 = (atan2(y,x));
  
  float[] a = polar(5,t2);
  fill(0);
  ellipse(a[0] + 300, a[1] + 300,5,5);
  x = mouseX - width/2 + 30;
  y = mouseY - height/2;
  
  t2 = (atan2(y,x));
  a = polar(5,t2);
  ellipse(a[0] + 330, a[1] + 300,5,5);
  
}

float[] polar(int raio, float angulo){
  float polar[] = {
    raio * cos(angulo), // position x
    raio * sin(angulo)  // position y
  };
  
  return polar;
}