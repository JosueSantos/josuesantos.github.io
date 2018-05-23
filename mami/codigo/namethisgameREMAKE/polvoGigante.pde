int quantTentaculos = 8, tamanhoTentaculos = 12, primeiroT;
float tintaPolvo = 0;
boolean toqueFundo = false;
int[] initPosiPolvo = { 100, 154, 244, 316, 406, 460, 550, 604};
int[][] tentaculos = new int[tamanhoTentaculos * quantTentaculos][6];
// -- tentaculos[][ x, y, movimento, vivo, lider, movimentoAnterior ]

void polvoGigante(){
  if(!inicioJogo && vidas > 0){
    if(temp % 8 == 0){
      criarNovo();
    }
    
    if(temp % 6 == 0){
      for(int i = 0; i < quantTentaculos; i++){
        primeiroT = i * tamanhoTentaculos;
        
        if(tentaculos[ primeiroT ][3] == 1){
          int movimento = (int) random(1,5);
          
          if(tentaculos[ primeiroT ][0] < initPosiPolvo[0]) movimento = 1;
          if(tentaculos[ primeiroT ][0] > initPosiPolvo[7]) movimento = 3;
          
          tentaculos[ primeiroT ][2] = tentaculos[ primeiroT ][0];
          switch(movimento){
                case 1:
                case 2:
                  tentaculos[ primeiroT ][0] += 18;
                  break;
                default:
                  tentaculos[ primeiroT ][0] += -18;
                  break;
          }
          
          for(int j = 0; j < tamanhoTentaculos; j++){
            int x = j + primeiroT;
            
            if(tentaculos[x][3] == 1){
              if(j < tamanhoTentaculos - 1){
                if(tentaculos[ x + 1 ][3] == 1){
                  tentaculos[ x + 1 ][2] = tentaculos[ x + 1 ][0];
                  tentaculos[ x + 1 ][0] = tentaculos[ x ][2];
                }
              }
              
              tentaculos[x][1] = height * 2/9 + 49 + 18*j;
            }
          }
        }
      }
      println();
    }
    
    fill(0);
    for(int i = 0; i < tamanhoTentaculos * quantTentaculos; i++){
      if(tentaculos[i][3] == 1){
        rect(tentaculos[i][0], tentaculos[i][1], 17,17);
      }
    }
    
    if (toqueFundo){
      faltaoxi.play();
      faltaoxi.amp(0.25);
      
      tintaPolvo += 0.05;
      
      if (tintaPolvo >= 1){
        morteMergulhador();
        toqueFundo = false;
      }
    }
    
    for(int i = 0; i < quantTentaculos; i++){
        primeiroT = i * tamanhoTentaculos;
        for(int j = 0; j < tamanhoTentaculos; j++){
          int x = j + primeiroT;
          
          if((tentaculos[x][4] == 1) && (xArpao >= tentaculos[x][0] && xArpao < tentaculos[x][0] + 17 && yArpao > tentaculos[x][1] -17 && yArpao < tentaculos[x][1] + 17)){
            tent.play();
            tent.amp(0.25);
            
            morteTentaculo(i);
          }
        }
    }
  }
}

void criarNovo(){
  int novoTentaculo = (int) random(0, quantTentaculos);
  int primeiroT = novoTentaculo * tamanhoTentaculos;
  
  for(int j = 0; j < tamanhoTentaculos; j++){
    int x = j + primeiroT;
    
    if(tentaculos[x][3] != 1){
      tentaculos[x][3] = 1;
      
      if(x == primeiroT){
        tentaculos[x][0] = initPosiPolvo[ novoTentaculo ];
        tentaculos[x][1] = height * 2/9 + 49 + 18*j;
        tentaculos[x][4] = 1;
      }else{
        tentaculos[x][0] = tentaculos[x-1][0];
        tentaculos[x][1] = height * 2/9 + 49 + 18*j;
        tentaculos[x-1][4] = 0;
        tentaculos[x][4] = 1;
        
        if(j == tamanhoTentaculos - 1)
          toqueFundo = true;
      }
      break;
    }
  }
}

void reiniciarPolvo(){
  for(int i = 0; i < tamanhoTentaculos * quantTentaculos; i++){
    tentaculos[i][3] = 0;
    tentaculos[i][4] = 0;
  }
  tintaPolvo = 0;
}

void morteTentaculo(int i){
  int primeiro = i * tamanhoTentaculos;
  for(int j = 0; j < tamanhoTentaculos; j++){
    int x = j + primeiro;
    
    tentaculos[x][3] = 0;
    tentaculos[x][4] = 0;
  }
  ponto += 50;
  xArpao = -50;
  tiroArpao = false;
}