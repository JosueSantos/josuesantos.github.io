void tubarao(){
  // tubarao
  if(tubaWins){
    if(tubaDireita)
      image(tubaMerguD, xTuba, yTuba, 110, 90);
    else
      image(tubaMerguE, xTuba, yTuba, 110, 90);
  }else{
    switch ( (temp + tempAnim) % 2){
      case 0:
        if(tubaDireita)
          image(tuba01D, xTuba, yTuba, 100, 50);
        else
          image(tuba01E, xTuba, yTuba, 100, 50);
        break;
      case 1:
      case -1:
        if(tubaDireita)
          image(tuba02D, xTuba, yTuba, 100, 50);
        else
          image(tuba02E, xTuba, yTuba, 100, 50);
        break;
    }
  }
  
  if(xTuba >= width - 50){
    tubaDireita = false;
    if(!inicioJogo){
      yTuba += 25;
      vTuba += addVTuba;
    }
    if(tubaWins)
      morteMergulhador();
      
  }else if(xTuba <= 50){
    tubaDireita = true;
    if(!inicioJogo){
      yTuba += 25;
      vTuba += addVTuba;
    }
    if(tubaWins)
      morteMergulhador();
  }
  
  if(tubaDireita){
    xTuba += vTuba;
  }else{
    xTuba -= vTuba;
  }
  
  if(xArpao > xTuba - 50 && xArpao < xTuba + 50 && yArpao > yTuba - 25 && yArpao < yTuba + 25){
    if(javascript != null) {
      javascript.playSoundTubarao();
    }else{
      tubarao.play();
      tubarao.amp(0.25);
    }
    
    tubaReinicio();
    
    ponto += 100;
    
    xArpao = -50;
    tiroArpao = false;
  }
  
  if(yTuba >= yMergu - 25){
    tubaWins = true;
    if(javascript != null) {
      javascript.playSoundFaltaOxi();
    }else{
      faltaoxi.play();
      faltaoxi.amp(0.25);
    }
  }
}

void tubaReinicio(){
  xTuba = width - 100;
  vTuba = 8;
  yTuba = height/10 + 27;
  tubaDireita = false;
}