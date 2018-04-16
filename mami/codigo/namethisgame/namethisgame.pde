int temp = 0, xMergu, xLancha, xTuba, yTuba, vTuba;
boolean merguDireita = false, lanchaDireita = false, tubaDireita = false;

void setup() {
  size(720, 580);
  frameRate(10);
  noStroke();
  
  carregarImagens();
  
  xMergu = width/2;
  xLancha = width - 100;
  
  xTuba = width - 100;
  vTuba = 8;
  yTuba = height/10 + 27;
}

void draw() {
  background(0, 0, 255);
  temp ++;
  
  cenario();
  lancha();
  mergulhador();
  tubarao();
}