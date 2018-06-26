// MAMI
// Josué

void setup() {
  size(800, 700);
  noStroke();
  textSize(40);
  carregarImagens();
}

void draw() {
  controlador();
  
  cenario();
  
  mergulhador();
  tubarao();
  polvo();
  lancha();
  tintaPolvo();
  
  painel();
}