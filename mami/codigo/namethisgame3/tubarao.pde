void tubarao(){
  if(inicioJogo){
    if (tempAnim % 100 < 3)
      image(tubaMergu1, xTuba, yTuba, 180*2, 120*2);
    else if (tempAnim % 100 < 6)
      image(tubaMergu2, xTuba, yTuba, 180*2, 120*2);
    else if (tempAnim % 100 < 9)
      image(tubaMergu3, xTuba, yTuba, 180*2, 120*2);
    else if (tempAnim % 9 < 3)
      image(tuba1, xTuba, yTuba, 180*2, 120*2);
    else if (tempAnim % 9 < 6)
      image(tuba2, xTuba, yTuba, 180*2, 120*2);
    else
      image(tuba3, xTuba, yTuba, 180*2, 120*2);
  }else{
    if(red) tint(255, 0, 0);
    
    if(xTuba >= width - tuba1.width/4 && !vitoria){
      tubaDireita = false;
      toqueLateral();
    }else if(xTuba <= tuba1.width/4 && !vitoria){
      tubaDireita = true;
      toqueLateral();
    }
    
    if(tubaDireita){
      xTuba += vTuba;
      
      wDTuba = tuba1.width;
      wETuba = 0;
    }else{
      xTuba -= vTuba;
      
      wDTuba = 0;
      wETuba = tuba1.width;
    }
    
    if(devorado){
      if (temp < tempTuba + 10)
        image(tubaMergu1, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
      else if (temp < tempTuba + 20)
        image(tubaMergu2, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
      else if (temp < tempTuba + 30){
        image(tubaMergu3, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
        mergulhadorDevorado = true;
        faltaoxi.play();
        faltaoxi.amp(0.25);
      }else
        image(tubaMergu4, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
    
    }else{
      if (temp % 240 < 10)
        image(tubaMergu1, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
      else if (temp % 240 < 20)
        image(tubaMergu2, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
      else if (temp % 240 < 30)
        image(tubaMergu3, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
      else if (temp % 30 < 10)
        image(tuba1, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
      else if (temp % 30 < 20)
        image(tuba2, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
      else
        image(tuba3, xTuba, yTuba, 180/2, 120/2, wDTuba, 0, wETuba, tuba1.height);
      
      colisaoTuba();
    }
  }
}

void tubaraoReinicio(){
  xTuba = width - tuba1.width/4;
  yTuba = height*1/5;
  vTuba = 3;
}

void colisaoTuba(){
  if(
    tiroArpao && 
    (xTuba - tuba1.width/4 + 5) < (xArpao + 7) && (xTuba + tuba1.width/4 - 5) > (xArpao - 7) &&
    (yTuba - tuba1.height/4 + 5) < (yArpao) && (yTuba + tuba1.height/4 - 5) > (yArpao - 20)
  ){
    tubarao.play();
    tubarao.amp(0.25);
    
    tubaraoReinicio();
    ponto += 100;
    tiroArpao = false;
  }
  if(xTuba > (xMergu - mergulhador1.width/4 - 30) && xTuba < (xMergu + mergulhador1.width/4 + 30) && yTuba == yMergu && !vitoria){
    devorado = true;
    tempTuba = temp;
    vTuba = 1;
  }
}

void toqueLateral(){
  if(devorado){
    devorado = false;
    mergulhadorDevorado = false;
    tubaraoReinicio();
    if(!toqueFundo)
      morteMergulhador();
  }else{
    if(vitoria){
    }else{
      vTuba += 2;
      
      if(yTuba > yMergu - mergulhador1.height/3 && vidas > 0)
        yTuba = yMergu;
      else
        yTuba += tuba1.height/5;
    }
  }
}