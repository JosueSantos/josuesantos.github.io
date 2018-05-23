void cenario(){
  image(fundo, width/2, height*4/9, width, height*7/9);
  
  //Céu
  image(ceu, width/2, 27, width, 60);
  //fill(255, 236, 79);
  //rect(0, 0, width, height/10);
  
  //Polvo Gigante
  image(polvo, width/2, height*2/9, 550, 125);
  
  //Fundo do Mar
  fill(35, 228, 235);
  rect(0, height * 4/5, width, height/5);
  
  switch (vidas){
    case 3:
      image(tesouro3, width/2, height-125, 80, 20);
      break;
    case 2:
      image(tesouro2, width/2, height-125, 80, 20);
      break;
    case 1:
      image(tesouro1, width/2, height-125, 80, 20);
      break;
  }
  
  float barraDif = widthBarra * dificuldade/100;
  fill(0, 225, 42);
  rect(width/2 - barraDif / 2, 471, barraDif, 15);
  
  if(oxigenio > 0){
    float barraOxi = widthBarra * oxigenio/100;
    fill(239, 195, 42);
    rect(width/2 - barraOxi / 2, height * 11/13 , barraOxi, 50);
  }else{
    if((oxigenio < -1 && oxigenio > -1.5) || (oxigenio < -2.5 && oxigenio > -3)){
      faltaoxi.play();
      faltaoxi.amp(0.25);
      
      fill(239, 195, 42);
      rect(width/2 - widthBarra / 2, height * 11/13 , widthBarra, 50);
    }else if(oxigenio < -4){
      morteMergulhador();
      oxigenio = 100;
    }
  }
  
  //Letreiro
  fill(255);
  textSize(40);
  text(txt, width/2 - textWidth(txt) / 2, height * 11/12);
  
  textSize(20);
  text("Recorde : " + recorde, width/15, height - 5);
}

void tintaPolvoFundo(){
  fill(0);
  rect(0, height * 8/12, width, (height/7) * tintaPolvo);
}