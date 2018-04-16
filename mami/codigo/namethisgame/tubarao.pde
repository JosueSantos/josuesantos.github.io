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
  
  if(yTuba >= 420){
    xTuba = width - 100;
    vTuba = 8;
    yTuba = height/10 + 27;
  }
}