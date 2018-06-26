void controlador(){
  if(inicioJogo){
    game = true;
    if(tempAnim == 0){
      xMergu = width + 100;
      yMergu = height * 7/10;
      
      xTuba = width + 1500;
      yTuba = yMergu;
    }
    
    tempAnim ++;
    xMergu -= 5;
    xTuba -= 10;
    
    if(tempAnim == 1 || tempAnim == 180){
      intro.play();
      intro.amp(0.25);
    }
    
    if(tempAnim < 60)
      txt = "JS.2018 produções";
    else if(tempAnim < 120)
      txt = "NAME THIS GAME -- REMAKE";
    else if(tempAnim < 180)
      txt = "Desenvolvedor Josué.Santos";
    else if(tempAnim < 240)
      txt = "Arte Gráfica Jonas.Santos";
    else if(tempAnim < 300)
      txt = "UFC - SMD";
    else{
      txt = "Pressione SPACE para iniciar";
      if(keyPressed){
        tempAnim = 0;
        inicioJogo = false;
        
        reiniciar();
      }
    }
  }else{
    temp++;
    txt = ponto+"";
    
    //Atualizar Recorde
    if(recorde < ponto){
      recorde = ponto;
    }
    
    //Letreiro Game Over
    if(vitoria && pv > 700){
      inicioJogo = true;
    }else if(vidas <= 0){
      gameover.play();
      gameover.amp(0.25);
      
      game = false;
      toqueFundo = true;
      txt = "Sua pontuação foi " + ponto;
    }else{
      if (temp % 10 == 0){
        oxigenio -= 0.2;
        dificuldade -= 0.1;
      }
      
      if(dificuldade <= 0){
        ponto += 1000;
        oxigenio = 100;
        dificuldade = 100;
        
        novoTentaculoTemp -= 5;
        vTuba += 3;
        
        if(red){
          nivel.play();
          nivel.amp(0.25);
          
          vitoria = true;
        }else{
          red = true;
          
          //nivel.play();
          //nivel.amp(0.25);
        }
      }
    }
  }
}

void reiniciar(){
  //Inicializar Variáveis de Controle
  widthBarra = width * 0.95;
  vidas = 3;
  ponto = 0;
  pv = 0;
  vitoria = false;
  
  xBarco = width - barco.width/2;
  yBarco = height*1/8;
  vBarco = 4;
  
  mergulhadorSurgir();
}