float causaDiversa, ferimento, doenca; 
float anguloAnterior, proximoAngulo; 

float textPosition;

void setup() {
  size(800, 600);
  background(128);
  
  DiagramaRose();
}

void DiagramaRose() {
  textPosition = 30;
  textSize(13);

  rect(10, 10, 150, 200);

  anguloAnterior = 0;
  proximoAngulo = radians(360/12);
  
  fill(0);
  text("Mês", 30, 25);

  textSize(12);
  for (int i = 0; i < 12; i++) {
    fill(0);
    text(i+1, 30, textPosition = textPosition + 10);

    doenca = int( random(250, 500) );
    fill(173, 216, 230);
    arc( width/2, height/2, doenca, doenca, anguloAnterior, proximoAngulo, PIE);
    text(int(doenca), 60, textPosition); 

    ferimento=int(random(125, 250));
    fill(255, 176, 173);
    arc( width/2, height/2, ferimento, ferimento, anguloAnterior, proximoAngulo, PIE);
    text(int(ferimento), 90, textPosition); 

    causaDiversa=int(random(0, 125));
    fill(50);
    arc( width/2, height/2, causaDiversa, causaDiversa, anguloAnterior, proximoAngulo, PIE);
    text(int(causaDiversa), 120, textPosition); 

    anguloAnterior = proximoAngulo;
    proximoAngulo = proximoAngulo + radians(360/12);
  }
  
  fill(173, 216, 230);
  text("Doenca", 30, 165);
  fill(255, 176, 173);
  text("Ferimento", 30, 180);
  fill(50);
  text("Causa Diversa", 30, 195);
}