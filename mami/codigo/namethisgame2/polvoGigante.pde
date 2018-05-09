int quantTentaculos = 8, tamanhoTentaculos = 12, primeiroT;
float tintaPolvo = 0;
boolean toqueFundo = false;
int[] initPosiPolvo = { 100, 154, 244, 316, 406, 460, 550, 604};
int[][] tentaculos = new int[tamanhoTentaculos * quantTentaculos][5];
// -- tentaculos[][ x, y, movimento, vivo, lider ]

void polvoGigante(){
  if(!inicioJogo && vidas > 0){
    if(temp % 8 == 0){
      criarNovo();
    }
    
    if(temp % 6 == 0){
      for(int i = 0; i < quantTentaculos; i++){
        primeiroT = i * tamanhoTentaculos;
        
        if(tentaculos[ primeiroT ][3] == 1){
          int movimento = (int) random(1,4);
          
          if(tentaculos[ primeiroT ][0] < initPosiPolvo[0]) movimento = 1;
          if(tentaculos[ primeiroT ][0] > initPosiPolvo[7]) movimento = 3;
          
          if(tentaculos[ primeiroT + 1 ][3] == 1){
            tentaculos[ primeiroT + 1 ][2] = tentaculos[ primeiroT ][2];
          }
          tentaculos[ primeiroT ][2] = movimento;
          
          for(int j = 0; j < tamanhoTentaculos; j++){
            int x = j + primeiroT;
            
            if(tentaculos[x][3] == 1){
              int mov;
              switch(tentaculos[primeiroT][2]){
                case 1:
                  mov = 18;
                  break;
                case 2:
                  mov = 0;
                  break;
                default:
                  mov = -18;
                  break;
              }
              
              tentaculos[x][0] += mov;
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
      if(javascript != null) {
        javascript.playSoundFaltaOxi();
      }else{
        faltaoxi.play();
        faltaoxi.amp(0.25);
      }
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
            if(javascript != null) {
              javascript.playSoundTentaculo();
            }else{
              tent.play();
              tent.amp(0.25);
            }
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