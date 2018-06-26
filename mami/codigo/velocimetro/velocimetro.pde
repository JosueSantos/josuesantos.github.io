PImage veloc;
float velocidade = 0, a, red = 0, y, yAnterior;
int x = 0;
float [] posy = new float[600+1];

void setup(){
  size(600,600);
  background(0);
  colorMode(HSB, 3000, 100, 100, 100);
  imageMode(CENTER);
  veloc = loadImage("speedEditada.jpg");
}

void draw(){
  a = radians(360/40);
  red = map(velocidade, 0, 30, 0, 100);
  float[] xY = polar(230, a * (velocidade + 15));
  strokeWeight(5);
  stroke(0, red, 100);
  tint(0, red, 100);
  
  image(veloc, 300, 200, 600, 600);
  line(300, 210, xY[0] + 300, xY[1] + 200);
  
  if(mousePressed){
    velocidade += 0.5;
  }else{
    velocidade -= 0.5;
  }
  if(velocidade < 0) velocidade = 0;
  if(velocidade > 30) velocidade = 30;
  
  y = map(velocidade, 0, 30, 590, 510);
  posy[x] = velocidade;
  line(x,y,x-1,yAnterior);
  stroke(50, 50, 100);
  ellipse(x,map(calculaMedia(), 0, 30, 590, 510),1,1);
  x ++;
  yAnterior = y;
  
  if(x > width){
    x = 0;
    background(0);
  }
}

float[] polar(int raio, float angulo){
  float polar[] = {
    raio * cos(angulo), // position x
    raio * sin(angulo)  // position y
  };
  
  return polar;
}

float calculaMedia(){
  int soma = 0;
  for(int i = 0; i < 600; i++){
    soma += posy[i];
  }
  
  return soma/600.0;
}