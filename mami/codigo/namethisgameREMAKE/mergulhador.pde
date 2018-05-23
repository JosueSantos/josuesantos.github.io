void mergulhador(){
  if(vidas > 0 && !inicioJogo && !tubaWins && !toqueFundo){
    // Mergulhador
    switch ( temp % 3){
      case 0:
        if(merguDireita)
          image(mergulhador01D, xMergu, yMergu, 100, 50);
        else
          image(mergulhador01E, xMergu, yMergu, 100, 50);
        break;
      case 1:
        if(merguDireita)
          image(mergulhador02D, xMergu, yMergu, 100, 50);
        else
          image(mergulhador02E, xMergu, yMergu, 100, 50);
        break;
      case 2:
        if(merguDireita)
          image(mergulhador03D, xMergu, yMergu, 100, 50);
        else
          image(mergulhador03E, xMergu, yMergu, 100, 50);
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
        case 0:
          // arpão
          if(!tiroArpao){
            if(merguDireita)
              xArpao = xMergu + 44;
            else
              xArpao = xMergu - 44;
            
            yArpao = yMergu - 20;
            tiroArpao = true;
          }
          break;
      }
    }
    
    if(xLancha > xMergu - 50 && xLancha < xMergu + 50 && magLanch){
      oxi.play();
      oxi.amp(0.25);
      
      oxigenio += 2;
      ponto += 10;
    }
  }else if(inicioJogo){
    switch ( (temp + tempAnim) % 3){
      case 0:
        image(mergulhador01E, xMergu, yMergu, 100, 50);
        break;
      case 1:
      case -1:
        image(mergulhador02E, xMergu, yMergu, 100, 50);
        break;
      case 2:
      case -2:
        image(mergulhador03E, xMergu, yMergu, 100, 50);
        break;
    }
  }
}

void morteMergulhador(){
  oxigenio = 100;
  vidas -= 1;
  
  xMergu = width/2;
  yMergu = height * 8/11;
  
  tubaWins = false;
  tubaReinicio();
  reiniciarPolvo();
}