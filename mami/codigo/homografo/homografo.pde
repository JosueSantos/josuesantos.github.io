float a = 2*PI;
float a2 = PI/2;

void setup(){
  size(600,600);
}

float[] polar(int raio, float angulo){
  float polar[] = {
    raio * cos(angulo), // position x
    raio * sin(angulo)  // position y
  };
  
  return polar;
}

void draw(){
  for(int i = 0; i < 10; i++){
    float xy[] = polar(100, a);
    float xy2[] = polar(150, a2);
    
    point(xy[0] + (xy2[0] + 300), xy[1] + (xy2[1] + 300));
    
    a += PI/180;
    a2 += PI/170;
  }
}