void lancha(){
  // Lancha
  switch ( (temp + tempAnim) % 2){
    case 0:
      if(lanchaDireita)
        image(lancha01D, xLancha, yLancha, 100, 50);
      else
        image(lancha01E, xLancha, yLancha, 100, 50);
      break;
    case 1:
    case -1:
      if(lanchaDireita)
        image(lancha02D, xLancha, yLancha, 100, 50);
      else
        image(lancha02E, xLancha, yLancha, 100, 50);
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
  
  if(tempMag > 100){
    tempMag = 0;
    magLanch = false;
  }else if(tempMag > tempWichMag){
    magLanch = true;
    rect(xLancha, yLancha + 15, 3, yMergu - yLancha);
  }
  
  if(!inicioJogo && vidas > 0){
    tempMag ++;
  }else{
    tempMag = 0;
  }
}