void mergulhador(){
  if(inicioJogo){
    if (tempAnim % 30 < 10)
      image(mergulhador1, xMergu, yMergu, 180*2, 120*2);
    else if (tempAnim % 30 < 20)
      image(mergulhador2, xMergu, yMergu, 180*2, 120*2);
    else
      image(mergulhador3, xMergu, yMergu, 180*2, 120*2);
  }else{
    noTint();
    if(vitoria){
      image(vitoriaMergu, width/2, yMergu - (pv/5), vitoriaMergu.width/2, vitoriaMergu.height/2);
    }else if(vidas > 0 && !mergulhadorDevorado){
      
      // Movimento Mergulhador
      if(keyPressed){
        switch(keyCode){
          case RIGHT:
            merguDireita = true;
            if(xMergu < width - mergulhador1.height/2)
              xMergu += vMergu;
            break;
          case LEFT:
            merguDireita = false;
            if(xMergu > mergulhador1.height/2)
              xMergu -= vMergu;
            break;
          case 0:
            // arpão
            if(!atirando && !tiroArpao){
              tempTiro = temp;
              atirando = true;
            }
            break;
        }
      }
        
      if(merguDireita){
        wDMergu = mergulhador1.width;
        wEMergu = 0;
      }else{
        wDMergu = 0;
        wEMergu = mergulhador1.width;
      }
      
      if(atirando){
        if (temp < tempTiro + 3)
          image(mergulhadorTiro1, xMergu, yMergu, 180/2, 120/2, wDMergu, 0, wEMergu, mergulhador1.height);
        else if (temp < tempTiro + 6)
          image(mergulhadorTiro2, xMergu, yMergu, 180/2, 120/2, wDMergu, 0, wEMergu, mergulhador1.height);
        else if (temp < tempTiro + 9){
          image(mergulhadorTiro3, xMergu, yMergu, 180/2, 120/2, wDMergu, 0, wEMergu, mergulhador1.height);
          
          if(merguDireita){
            xArpao = xMergu + 35;
            wDArpao = arpao.width;
            wEArpao = 0;
          }else{
            xArpao = xMergu - 35;
            wDArpao = 0;
            wEArpao = arpao.width;
          }
          
          yArpao = yMergu - 20;
          tiroArpao = true;
          
        }else if (temp < tempTiro + 12)
          image(mergulhadorTiro4, xMergu, yMergu, 180/2, 120/2, wDMergu, 0, wEMergu, mergulhador1.height);
        else if (temp < tempTiro + 15){
          image(mergulhadorTiro5, xMergu, yMergu, 180/2, 120/2, wDMergu, 0, wEMergu, mergulhador1.height);
          
          atirando = false;
        }
      }else{
        if (temp % 21 < 7)
          image(mergulhador1, xMergu, yMergu, 180/2, 120/2, wDMergu, 0, wEMergu, mergulhador1.height);
        else if (temp % 30 < 14)
          image(mergulhador2, xMergu, yMergu, 180/2, 120/2, wDMergu, 0, wEMergu, mergulhador1.height);
        else
          image(mergulhador3, xMergu, yMergu, 180/2, 120/2, wDMergu, 0, wEMergu, mergulhador1.height);
      }
      atirarArpao();
      
      if(fundoMangueira && xMang > (xMergu-180/4) && xMang < (xMergu+180/4)){
        oxi.play();
        oxi.amp(0.01);
        
        ponto += 1;
        oxigenio += 0.15;
        if(oxigenio > 100) oxigenio = 100;
      }
    }
  }
}

void mergulhadorSurgir(){
  xMergu = width/2;
  yMergu = height * 7/10;
  
  vMergu = 2;
  vArpao = 8;
  
  toqueFundo = false;
  tentaculos = new int[tamanhoTentaculos * quantTentaculos][6];
  novoTentaculoTemp = 30;
  
  tubaraoReinicio();
  oxigenio = 100;
  dificuldade = 100;
  red = false;
}

void morteMergulhador(){
  vidas --;
  mergulhadorSurgir();
}