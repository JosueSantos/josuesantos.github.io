int px = 20, py = 200, pv = 5;
int bx = 645;
boolean salto = false, descida = false, jogo = true;
PImage img;
int chance = 3;
String txt;

void setup(){
  size(700, 300);
  strokeWeight(10);
  textSize(30);
  img = loadImage("codigo/breakout/coracao.gif");
}

void draw(){
  background(128);
  if(jogo){
    desenhaPersonagem();
    desenhaBola();
  }else{
    text(txt, width/2 - textWidth(txt)/2, height/2);
    
    text("SPACE para reiniciar", 10, 290);
    if(keyPressed){
      if (keyCode == 0){
        chance = 3;
        px = 20;
        py = 200;
        bx = 645;
        jogo = true;
      }
    }
  }
}

void desenhaPersonagem(){
  if(chance >= 1)
    image(img, 0, 0, 50, 50);
  if(chance >= 2)
    image(img, 50, 0, 50, 50);
  if(chance >= 3)
    image(img, 100, 0, 50, 50);
  //text(chance, 160, 40);
  
  ellipse(px, py, 20, 20);
  line(px, py+20, px, py+60);
  line(px, py+55, px+25, py+95);
  line(px, py+55, px+-25, py+95);
  
  line(px, py+15, px+25, py+50);
  line(px, py+15, px+-25, py+50);
  
  //centro
  //ellipse(px, py+45, 10, 10);
  
  if(salto){
    if(descida){
      py += pv;
      
      if(py >= 200){
        py = 200;
        salto = false;
        descida = false;
      }
    }else{
      py -= pv;
      if(py < 50)
        descida = true;
    }
  }else{
    if(keyPressed){
      switch (keyCode){
        case RIGHT:
          px += pv;
          break;
        case LEFT:
          px -= pv;
          break;
        case 0:
          salto = true;
          break;
      }
    }
  }
  
  if(px <= bx+50 && px >= bx-50 && py <= 240+50 && py >= 240-50){
    chance --;
    px = 20;
    py = 200;
  }
  
  if(px > 725){
    jogo = false;
    txt = "Vitoria!!";
  }
  if(chance == 0){
    jogo = false;
    txt = "Morreu!! Game Over!";
  }
}

void desenhaBola(){
  ellipse(bx, 240, 105, 105);
  bx -= pv;
  
  if(bx < -50) bx = 750;
}