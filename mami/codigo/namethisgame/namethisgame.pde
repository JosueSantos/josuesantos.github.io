int temp = 0, ponto = 0, xMergu, vMergu, xLancha, vLancha, xTuba, yTuba, vTuba, xArpao, yArpao, vArpao;
boolean merguDireita = false, lanchaDireita = false, tubaDireita = false, tiroArpao = false;

void setup() {
  size(720, 580);
  frameRate(10);
  noStroke();
  textSize(40);
  
  carregarImagens();
  
  xMergu = width/2;
  vMergu = 10;
  
  xLancha = width - 100;
  vLancha = 10;
  
  xTuba = width - 100;
  vTuba = 8;
  yTuba = height/10 + 27;
  
  vArpao = 25;
}

void draw() {
  background(0, 0, 255);
  temp ++;
  
  cenario();
  lancha();
  //tubarao();
  //polvo();
  //mergulhador();
  //atirarArpao();
}

PImage mergulhador01E,
       mergulhador01D,
       mergulhador02E,
       mergulhador02D,
       mergulhador03E,
       mergulhador03D,
       lancha01E,
       lancha01D,
       lancha02E,
       lancha02D,
       polvo,
       tuba01E,
       tuba01D,
       tuba02E,
       tuba02D,
       tesouro1,
       tesouro2,
       tesouro3;
       
void carregarImagens(){
  imageMode(CENTER);
  mergulhador01E = loadImage("codigo/namethisgame/mergulhador01E.png");
  mergulhador01D = loadImage("codigo/namethisgame/mergulhador01D.png");
  
  mergulhador02E = loadImage("codigo/namethisgame/mergulhador02E.png");
  mergulhador02D = loadImage("codigo/namethisgame/mergulhador02D.png");
  
  mergulhador03E = loadImage("codigo/namethisgame/mergulhador03E.png");
  mergulhador03D = loadImage("codigo/namethisgame/mergulhador03D.png");
  
  lancha01E = loadImage("codigo/namethisgame/lancha01E.png");
  lancha01D = loadImage("codigo/namethisgame/lancha01D.png");
  
  lancha02E = loadImage("codigo/namethisgame/lancha02E.png");
  lancha02D = loadImage("codigo/namethisgame/lancha02D.png");
  
  polvo = loadImage("codigo/namethisgame/polvo.png");
  
  tuba01E = loadImage("codigo/namethisgame/tubarao01E.png");
  tuba01D = loadImage("codigo/namethisgame/tubarao01D.png");
  
  tuba02E = loadImage("codigo/namethisgame/tubarao02E.png");
  tuba02D = loadImage("codigo/namethisgame/tubarao02D.png");
  
  //tesouro1 = loadImage("codigo/namethisgame/tesouro01.png");
  //tesouro2 = loadImage("codigo/namethisgame/tesouro02.png");
  //tesouro3 = loadImage("codigo/namethisgame/tesouro03.png");
}

void cenario(){
  //Cenário
  fill(255, 236, 79);
  rect(0, 0, width, height/10);
  fill(35, 228, 235);
  rect(0, height*4/5, width, height/5);
  
  //image(tesouro3, width/2, height-125, 80, 20);
  
  fill(255);
  float tex = textWidth(ponto+"")/2;
  text(ponto, width/2 - tex, height-45);
}

void lancha(){
  // Lancha
  switch ( temp % 2){
    case 0:
      if(lanchaDireita)
        image(lancha01D, xLancha, height/10 - 13, 100, 50);
      else
        image(lancha01E, xLancha, height/10 - 13, 100, 50);
      break;
    case 1:
      if(lanchaDireita)
        image(lancha02D, xLancha, height/10 - 13, 100, 50);
      else
        image(lancha02E, xLancha, height/10 - 13, 100, 50);
      break;
  }
  
  if(xLancha >= width - 50){
    lanchaDireita = false;
  }else if(xLancha <= 50){
    lanchaDireita = true;
  }
  
  if(lanchaDireita){
    xLancha += vLancha;
  }else{
    xLancha -= vLancha;
  }
}

void tubarao(){
  // tubarao
  switch ( temp % 2){
    case 0:
      if(tubaDireita)
        image(tuba01D, xTuba, yTuba, 100, 50);
      else
        image(tuba01E, xTuba, yTuba, 100, 50);
      break;
    case 1:
      if(tubaDireita)
        image(tuba02D, xTuba, yTuba, 100, 50);
      else
        image(tuba02E, xTuba, yTuba, 100, 50);
      break;
  }
  
  if(xTuba >= width - 50){
    tubaDireita = false;
    yTuba += 25;
    vTuba += 5;
  }else if(xTuba <= 50){
    tubaDireita = true;
    yTuba += 25;
    vTuba += 5;
  }
  
  if(tubaDireita){
    xTuba += vTuba;
  }else{
    xTuba -= vTuba;
  }
  
  if(xArpao > xTuba - 50 && xArpao < xTuba + 50 && yArpao > yTuba - 25 && yArpao < yTuba + 25){
    xTuba = width - 100;
    vTuba = 8;
    yTuba = height/10 + 27;
    tubaDireita = false;
    
    ponto += 100;
    
    xArpao = -50;
    tiroArpao = false;
  }
  
  if(yTuba >= 420){
    //JogadorMorre
    xTuba = width - 100;
    vTuba = 8;
    yTuba = height/10 + 27;
    tubaDireita = false;
  }
}

void polvo(){
  image(polvo, width/2, 125, 550, 125);
}

void mergulhador(){
  // Mergulhador
  switch ( temp % 3){
    case 0:
      if(merguDireita)
        image(mergulhador01D, xMergu, 420, 100, 50);
      else
        image(mergulhador01E, xMergu, 420, 100, 50);
      break;
    case 1:
      if(merguDireita)
        image(mergulhador02D, xMergu, 420, 100, 50);
      else
        image(mergulhador02E, xMergu, 420, 100, 50);
      break;
    case 2:
      if(merguDireita)
        image(mergulhador03D, xMergu, 420, 100, 50);
      else
        image(mergulhador03E, xMergu, 420, 100, 50);
      break;
  }
  
  // Movimento Mergulhador
  if(keyPressed){
    switch(keyCode){
      case RIGHT:
        merguDireita = true;
        if(xMergu < width - 50)
          xMergu += vMergu;
        break;
      case LEFT:
        merguDireita = false;
        if(xMergu > 50)
          xMergu -= vMergu;
        break;
        /*
      case 0:
        // arpão
        if(!tiroArpao){
          if(merguDireita)
            xArpao = xMergu + 44;
          else
            xArpao = xMergu - 44;
          
          yArpao = 420 - 20;
          tiroArpao = true;
        }
        break;
        */
    }
  }
}
/*
void atirarArpao(){
  if(tiroArpao){
    ellipse(xArpao, yArpao, 5, 5);
    yArpao -= vArpao;
  }
  
  if(yArpao < height/10)
    tiroArpao = false;
}
*/