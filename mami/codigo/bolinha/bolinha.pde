/// MAMI ///
/// Josue dos Santos ///

float tAtual = 0;
float vInicialH = 30.0;
float vInicialV = 80.0;
float aAtual = 10.0;
float dAtual;

float xInicial = 15;
float yInicial = 585;
 
void setup (){
  frameRate(120);
  size(700, 600);
}

void draw (){
  background(0);
  
  dAtual = MRUV(-vInicialV, aAtual, tAtual); // Contraposição de velocidade contra aceleração da gravidade
  
  float x = xInicial + MRU(vInicialH,tAtual);
  float y = yInicial + dAtual;
  
  if(y >= yInicial){
    xInicial = x;
    
    vInicialV /= 1.5;
    vInicialH /= 1.2;
    
    tAtual = 0;
  }
  
  ellipse(x, y, 30, 30);
  
  tAtual += 1/60.0;
}

float MRUV(float v, float a, float t){//y
  float d;
  d = v*t + a*t*t/2.0;
  return(d);
}

float MRU(float v, float t){//x
  float d;
  d = v*t;
  return(d);
}