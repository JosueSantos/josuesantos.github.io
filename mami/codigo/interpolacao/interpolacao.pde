/// MAMI ///
/// Josue dos Santos ///

float t = 0;
float xInicial, yInicial, distanciaX, distanciaY;

float velocidade = 120;
// velocidade = Pixel por segundo

float velocidadeFrame = velocidade/60.0;
// velocidadeFrame = Pixel por Frame
// 60.0 = Frame por segundo

float distancia2D(){
  float x = distanciaX;
  float y = distanciaY;
  
  return (sqrt( (x*x) + (y*y) ));
}

void temporizador(){
  if(t < 1){
    t += velocidadeFrame/distancia2D();
  }else{
    t = 1.0;
  }
}

void setup(){
  size(800, 600);
  rectMode(CENTER);
}

void draw(){
  background(0);
  rect(xInicial + t * distanciaX, yInicial + t * distanciaY, 30, 30);
  temporizador();
  
  ellipse(distanciaX + xInicial, distanciaY + yInicial, 10, 10);
}

void mouseClicked() {
  xInicial += t * distanciaX;
  yInicial += t * distanciaY;
  
  distanciaX = mouseX - xInicial;
  distanciaY = mouseY - yInicial;
  
  t = 0;
}