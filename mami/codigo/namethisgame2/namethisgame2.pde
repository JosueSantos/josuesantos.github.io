// MAMI
// Josué

void setup() {
  size(720, 580);
  frameRate(10);
  noStroke();
  textSize(40);
  carregarImagens();
  
  xMergu = width/2;
  yMergu = height * 8/11;
  vMergu = 20;
  
  xLancha = width - 100;
  yLancha = height/10 - 13;
  vLancha = 15;
  
  xTuba = width - 100;
  yTuba = height/10 + 27;
  addVTuba = 8;
  vTuba = addVTuba;
  
  vidas = 3;
  vArpao = 30;
  tempWichMag = 80;
  
  widthBarra = width * 0.95;
  oxigenio = 100;
  dificuldade = 100;
  inicioJogo = true;
}

void draw() {
  background(0, 0, 255);
  
  controlador();
  
  cenario();
  lancha();
  tubarao();
  polvoGigante();
  mergulhador();
  atirarArpao();
  tintaPolvoFundo();
}