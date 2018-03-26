/// MAMI ///
/// Josue dos Santos ///

void setup(){
  size(800,700);
  background(255);
  mostrarBandeiraBrasil(400, 350, 500);
}

void mostrarBandeiraBrasil(int x, int y, int l){
  float largura = (float) l;
  float modulo  = largura / 20;
  float altura  = modulo * 14;
  float distanciaVertices = modulo * 1.7;
  float raio = modulo * 3.5;
  
  float centroEsquerdoX = x - (largura)/2 + distanciaVertices;
  float centroEsquerdoY = y;
  
  float superiorX = x;
  float superiorY = y- (altura)/2 + distanciaVertices;
  
  float centroDireitoX = x+(largura)/2 - distanciaVertices;
  float centroDireitoY = y;
  
  float inferiorX = x;
  float inferiorY = y + (altura)/2 - distanciaVertices;

  noStroke();
  
  fill(0, 156, 62);
  rectMode(CENTER);
  rect(x, y, largura, altura);
  
  fill(248, 193, 0);
  quad( centroEsquerdoX, centroEsquerdoY, superiorX, superiorY, centroDireitoX,centroDireitoY,inferiorX, inferiorY);
  
  fill(40, 22, 111);
  ellipseMode(RADIUS);
  ellipse(x , y, raio, raio);
}