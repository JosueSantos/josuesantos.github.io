void controlador(){
  if(vidas > 0 && !inicioJogo && !tubaWins && !toqueFundo){
    oxigenio -= 0.2;
    dificuldade -= 0.05;
    
    if(oxigenio > 100){
      oxigenio = 100;
    }
    
    if(dificuldade <= 0){
      if(javascript != null) {
        javascript.playSoundNivel();
      }else{
        nivel.play();
        nivel.amp(0.25);
      }
      
      addVTuba += 5;
      tempWichMag += 5;
      
      oxigenio = 100;
      dificuldade = 100;
    }
  }
  
  //Letreiros Iniciais e START GAME
  if(inicioJogo && vidas > 0){
    tempAnim ++;
    
    if(tempAnim == 1){
      if(javascript != null) {
        javascript.playSoundIntro();
      }else{
        intro.play();
        intro.amp(0.25);
      }
    }
    
    if(tempAnim < 20)
      txt = "COPYRIGHT 1982";
    else if(tempAnim < 40)
      txt = "U.S. GAMES";
    else{
      txt = "GAME |";
      if(keyPressed){
        tempAnim = 0;
        inicioJogo = false;
      }
    }
  }else{
    temp ++;
  }
  
  if(!inicioJogo){
    txt = ponto+"";
    //Letreiro Game Over
    if(vidas <= 0){
      if(javascript != null) {
        javascript.playSoundGameover();
      }else{
        gameover.play();
        gameover.amp(0.25);
      }
      txt = "GAME OVER";
      temp = -40;
      inicioJogo = true;
      oxigenio = 100;
      dificuldade = 100;
    }
  }
  
  //Reiniciar Jogo
  if(inicioJogo && temp > 0){
    xMergu = width/2;
    yMergu = height * 8/11;
    vidas = 3;
    ponto = 0;
    
    addVTuba = 8;
    tempWichMag = 80;
  }
  
  if(recorde < ponto) recorde = ponto;
}