void mergulhador(){
  // arpão
  if(merguDireita)
    ellipse(xMergu + 44, 420 - 20, 5, 5);
  else
    ellipse(xMergu - 44, 420 - 20, 5, 5);
  
  
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
        xMergu += 5;
        break;
      case LEFT:
        merguDireita = false;
        xMergu -= 5;
        break;
    }
  }
}