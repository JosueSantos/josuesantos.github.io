void lancha(){
  if(!inicioJogo){
    noTint();
    if(vitoria){
      image(barco01, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
    }else{
      if (temp > 0 && vidas > 0 && temp % (tempMang + 400) == 0){
        LanceMangueira = true;
        tempMang = temp;
        
        if(barcoDireita){
          xMang = xBarco - 11;
        }else{
          xMang = xBarco + 11;
        }
      }
      
      if(LanceMangueira){
        if (temp < tempMang + 10)
          image(barco01, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
        else if (temp < tempMang + 20)
          image(barco02, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
        else if (temp < tempMang + 30)
          image(barco03, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
        else if (temp < tempMang + 40)
          image(barco04, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
        else if (temp < tempMang + 50)
          image(barco05, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
        else if (temp < tempMang + 60)
          image(barco06, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
        else if (temp < tempMang + 70)
          image(barco07, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
        else if (temp < tempMang + 80)
          image(barco08, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
        else if (temp < tempMang + 90){
          image(barco09, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
          image(mangueira, xMang, yBarco + 220, 4, 400);
          fundoMangueira = true;
        }else if (temp > tempMang + 300){
          LanceMangueira = false;
          fundoMangueira = false;
          tempMang = temp;
        }else{
          image(barco10, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
          image(mangueira, xMang, yBarco + 220, 4, 400);
        }
        
      }else{
        if(xBarco >= width - 50){
          barcoDireita = false;
        }else if(xBarco <= 50){
          barcoDireita = true;
        }
        
        if(barcoDireita){
          xBarco += vBarco;
          
          wDBarco = barco.width;
          wEBarco = 0;
        }else{
          xBarco -= vBarco;
          
          wDBarco = 0;
          wEBarco = barco.width;
        }
          
        image(barco, xBarco, yBarco, 300/2, 200/2, wDBarco, 0, wEBarco, barco.height);
      }
    }
  }
}