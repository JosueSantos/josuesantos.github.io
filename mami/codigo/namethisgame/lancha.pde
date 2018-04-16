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
    xLancha += 10;
  }else{
    xLancha -= 10;
  }
}