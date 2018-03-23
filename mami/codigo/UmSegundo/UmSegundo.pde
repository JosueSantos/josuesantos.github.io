/// MAMI ///
/// Josue dos Santos ///

float tAtual = 0;
int vAtual = 30;
int dAtual;

void setup(){
  frameRate(60);
  
  size(600, 600);
  background(255);
  
  mostraMundo();
}

void draw(){
  //background(0);
  dAtual = MRU(vAtual, tAtual);
  println(vAtual, " ", tAtual, " ", dAtual);
  ellipse(dAtual,300,30,30);
  tAtual += 1/60.0;
}

int MRU(int v, float t){
  float d;
  d = v*t;
  return((int) d);
}

void mostraMundo(){
  for(int i = 0; i < 12; i++){
    line(i*50,0,i*50,600);
    line(0,i*50,600,i*50);
  }
}