void cenario(){
  if(inicioJogo){
    noTint();
    image(menu, width/2, height/2, 800, 700);
    
    //Letreiro
    fill(255);
    textSize(40);
    text(txt, width/2 - textWidth(txt) / 2, height/2);
    
    //Letreiro Sombra Titulo Azul
    fill(0, 0, 255);
    textSize(80);
    text("SeteLéguas", width/2 - textWidth("SeteLéguas") / 2, height*1/5);
    
    //Letreiro Titulo Branco
    fill(255);
    textSize(80);
    text("SeteLéguas", width/2 - textWidth("SeteLéguas") / 2, height*1/5 +3);
  }else{
    noTint();
    image(fundo, width/2, height/2 - 50, 800, 600);
    
    if (temp % 40 > 20)
      image(mar1, width/2, height*1/6 + 10, 800, 48);
    else
      image(mar2, width/2, height*1/6 + 10, 800, 48);
    
    if(!vitoria){
      switch (vidas){
        case 0:
          image(tesouro1, width/2, height*8/10 - 5, 180/2, 180/2);
          break;
        case 1:
        case 2:
          image(tesouro2, width/2, height*8/10 - 5, 180/2, 180/2);
          break;
        case 3:
          image(tesouro3, width/2, height*8/10 - 5, 180/2, 180/2);
          break;
      }
    }
  }
}

void painel(){
  if(!inicioJogo){
    //Fundo do Mar
    fill(35, 228, 235);
    rect(0, height * 6/7, width, height);
    
    float barraDif = widthBarra * dificuldade/100;
    
    if(red)
     fill(255, 0, 0);
    else    
      fill(0, 225, 42);
    rect(width/2 - barraDif / 2, height * 13/15, barraDif, 10);
    
    if(oxigenio > 0){
      float barraOxi = widthBarra * oxigenio/100;
      fill(239, 195, 42);
      rect(width/2 - barraOxi / 2, height * 14/16+7 , barraOxi, 15);
    }else{
      if((oxigenio < -1 && oxigenio > -1.5) || (oxigenio < -2.5 && oxigenio > -3)){
        if(temp % 20==0){
          faltaoxi.play();
          faltaoxi.amp(0.25);
        }
        
        fill(239, 195, 42);
        rect(width/2 - widthBarra / 2, height * 14/16+7 , widthBarra, 15);
      }else if(oxigenio < -4){
        morteMergulhador();
      }
    }
    
    //Letreiro
    fill(255);
    textSize(40);
    text(txt, width/2 - textWidth(txt) / 2, height * 24/25);
    
    textSize(20);
    text("Recorde : " + recorde, width/15, height - 5);
    
    if(!game){
      textSize(60);
      text("GAME OVER", width/2 - textWidth("GAME OVER") / 2, height/2);
    }
    if(vitoria){
      textSize(40);
      text("Parabéns Conquistador dos Mares!!", width/2 - textWidth("Parabens Conquistador dos Mares!!") / 2, height/2);
    }
  }
}