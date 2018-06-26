void polvo(){
  if(!inicioJogo){
    if(red) tint(255, 0, 0);
    
    image(tentaculoCompleto, width/2 - 10 + pv, height*1/3 - 10, 700, 160);
    
    if(polvoDor){
      image(polvo4, width/2 + pv, height*1/3, 180, 180);
      if(temp % (tempPolvoDor + 60) == 0)
        polvoDor = false;
    }else if (temp % 240 < 10)
      image(polvo2, width/2 + pv, height*1/3, 180, 180);
    else if (temp % 240 < 20)
      image(polvo3, width/2 + pv, height*1/3, 180, 180);
    else
      image(polvo1, width/2 + pv, height*1/3, 180, 180);
    
    if(!vitoria && !devorado && temp % novoTentaculoTemp == 0){
      criarNovoTen();
    }
    
    if(temp % 20 == 0){
      movimentoTen();
    }
    
    desenhaTent();
    if(vitoria){
      pv ++;
    }
  }
}

void tintaPolvo(){
  if(toqueFundo){
    if(tintaFundo > 0){
      tintaFundo --;
    }else{
      tintaFundo = 160;
      if(vidas > 0)
        morteMergulhador();
      else{
        inicioJogo = true;
        toqueFundo = false;
      }
    }
    
    image(fumaca, width/2, height * 6/9 + tintaFundo, width+100, height/2);
  }
}

void polvoAtingido(){
  polvoDor = true;
  tempPolvoDor = temp;
}

void criarNovoTen(){
  int novoTentaculo = (int) random(0, quantTentaculos);
  int primeiroT = novoTentaculo * tamanhoTentaculos;
  
  for(int i = 0; i < tamanhoTentaculos; i++){
    int x = i + primeiroT;
    
    if(tentaculos[x][3] != 1){
      tentaculos[x][3] = 1;
      
      if(x == primeiroT){
        tentaculos[x][0] = initPosiPolvo[ novoTentaculo ];
        tentaculos[x][1] = height * 2/5 + 15 + 10;
        tentaculos[x][4] = 1;
      }else{
        tentaculos[x][0] = tentaculos[x-1][0];
        tentaculos[x][1] = height * 2/5 + 15 + 15 * i + 10;
        tentaculos[x-1][4] = 0;
        tentaculos[x][4] = 1;
        
        if(i == tamanhoTentaculos - 1 && vidas > 0){
          toqueFundo = true;
          
          faltaoxi.play();
          faltaoxi.amp(0.25);
        }
      }
      break;
    }
  }
}

void movimentoTen(){
  for(int j = 0; j < quantTentaculos; j++){
    int primeiroT = j * tamanhoTentaculos;
    
    if(tentaculos[ primeiroT ][3] == 1){
      int movimento = (int) random(1,5);
      
      if(tentaculos[ primeiroT ][0] < initPosiPolvo[0]) movimento = 1;
      if(tentaculos[ primeiroT ][0] > initPosiPolvo[7]) movimento = 4;
      
      tentaculos[ primeiroT ][2] = tentaculos[ primeiroT ][0];
      switch(movimento){
        case 1:
        case 2:
          tentaculos[ primeiroT ][0] += 10;
          break;
        default:
          tentaculos[ primeiroT ][0] += -10;
          break;
      }
      
      for(int i = 0; i < tamanhoTentaculos; i++){
        int x = i + primeiroT;
        
        if(
          tiroArpao && 
          (tentaculos[x][0] - 15) < (xArpao + 7) && (tentaculos[x][0] + 15) > (xArpao - 7) &&
          (tentaculos[x][1] - 15) < (yArpao + 40) && (tentaculos[x][1] + 15) > (yArpao - 40)
        ){
          tent.play();
          tent.amp(0.25);
          
          morteTentaculo(j);
        }
        
        if(tentaculos[x][3] == 1){
          if(i < tamanhoTentaculos - 1){
            if(tentaculos[ x + 1 ][3] == 1){
              tentaculos[ x + 1 ][2] = tentaculos[ x + 1 ][0];
              tentaculos[ x + 1 ][0] = tentaculos[ x ][2];
            }
          }
        }
      }
    }
  }
}

void morteTentaculo(int i){
  polvoAtingido();
  
  int primeiro = i * tamanhoTentaculos;
  for(int j = 0; j < tamanhoTentaculos; j++){
    int x = j + primeiro;
    
    tentaculos[x][3] = 0;
    tentaculos[x][4] = 0;
  }
  ponto += 50;
  tiroArpao = false;
}

void desenhaTent(){
  for(int i = 0; i < tamanhoTentaculos * quantTentaculos; i++){
    if(tentaculos[i][3] == 1){
      if(tentaculos[i][4] == 1){
        image(pontaTentaculo, tentaculos[i][0] + pv, tentaculos[i][1]+5, 30, 30);
      }else{
        image(tentaculo, tentaculos[i][0] + pv, tentaculos[i][1], 25, 25);
      }
    }
  }
}