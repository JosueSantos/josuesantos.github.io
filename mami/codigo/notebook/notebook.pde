/// MAMI ///
/// Josue dos Santos ///

float proporcao(float maxValorReal, float maxEscala, float valorEscalado){
  return maxValorReal*valorEscalado/maxEscala;
}

void setup(){
  size(600,600);
  rectMode(CENTER);
  textSize(15);
}

void draw(){
  background(0);
  int modulo = width/17;
  
  //16:9
  fill(255);
  rect( width/2, modulo*5, modulo*16, modulo*9);
  fill(0);
  text( "16:9", width/2, modulo*5);
  
  //4:3
  fill(255);
  rect( width/2, modulo*12, modulo*4, modulo*3);
  fill(0);
  text( "4:3", width/2, modulo*12);
  
  float pontoMinimoX = width/2 - modulo*4/2;
  float pontoMaximoX = width/2 + modulo*4/2;
  float pontoMinimoY = modulo*12 - modulo*3/2;
  float pontoMaximoY = modulo*12 + modulo*3/2;
  
  if(
    mouseX >= pontoMinimoX &&
    mouseX <= pontoMaximoX &&
    mouseY >= pontoMinimoY &&
    mouseY <= pontoMaximoY
  ){
    float pontoX = width/2 - modulo*16/2;
    float pontoY = modulo*5 - modulo*9/2;
    
    float lx = proporcao(1, modulo*4, mouseX-pontoMinimoX);
    float ly = proporcao(1, modulo*3, mouseY-pontoMinimoY);
    
    ellipse( proporcao(modulo*16, 1, lx) + pontoX, proporcao(modulo*9, 1, ly) + pontoY, 10, 10);
  }
}