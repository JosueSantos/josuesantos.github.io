/// MAMI ///
/// Josue dos Santos ///

float textTamanho = 60;
float textX = 50;
float textY = 150;

float alinhamentoPonto;
float alinhamnetoPontoX1;
float alinhamnetoPontoX2;
float alinhamnetoPontoX3;

float pontoX1 = 168;
float pontoY1 = 406;

float pontoX2 = 400;
float pontoY2 = 406;

void setup(){
  strokeWeight(3);
  textSize(textTamanho);
  fill(0);
  
  size(600, 600);
  
  alinhamentoPonto   = textY - textTamanho/2;
  alinhamnetoPontoX1 = textX - textTamanho/2;
  alinhamnetoPontoX2 = textWidth("WHITNEY") + textX + textTamanho/2;
  alinhamnetoPontoX3 = width - textTamanho/2;
}

void draw(){
  background(255);
  
  text("WHITNEY", textX, textY);
  
  line(alinhamnetoPontoX1, alinhamentoPonto, pontoX1, pontoY1);
  line(alinhamnetoPontoX2, alinhamentoPonto, pontoX1, pontoY1);
  
  line(alinhamnetoPontoX2, alinhamentoPonto, pontoX2, pontoY2);
  line(alinhamnetoPontoX3, alinhamentoPonto, pontoX2, pontoY2);
}

void keyPressed(){
  if (key == '1'){
    pontoX1 = mouseX;
    pontoY1 = mouseY;
    
  }else if(key == '2'){
    pontoX2 = mouseX;
    pontoY2 = mouseY;
    
  }
}