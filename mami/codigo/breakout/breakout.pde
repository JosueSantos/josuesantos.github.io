/// MAMI ///
/// Josue dos Santos ///

int bastaoX = 0;
int bastaoY = 380;

int bolaX;
int bolaY;
int dX = 5;
int dY = 5;

int count =0;
boolean iniciarJogo = false;

PImage img;
int vidas = 3;

float temp = 0;

void setup(){
 size(800, 450);
 fill(255);
 textSize(30);
 bastaoX = width/2-50;
 img = loadImage("codigo/breakout/coracao.gif");
}

void draw(){
  background(0);
  
  if (keyPressed == true){
    switch(keyCode){
      case RIGHT:
        if(bastaoX < width-100)
          bastaoX += 7;
        else
          bastaoX = width-100;
        break;
      case LEFT:
        if(bastaoX > 0)
          bastaoX -= 7;
        else
          bastaoX = 0;
        break;
      case 0:
        if(iniciarJogo == false)
          iniciarJogo = true;
        break;
    }
  }
  
  if(temp >= 0 && vidas <= 0){
    vidas = 3;
    count = 0;
    iniciarJogo = false;
  }else{
    temp ++;
  }
  
  // Interface
  rect(bastaoX , bastaoY, 100, 20);
  ellipse(bolaX , bolaY, 20, 20);
  
  if(vidas >= 1)
    image(img, 0, 0, 50, 50);
  if(vidas >= 2)
    image(img, 50, 0, 50, 50);
  if(vidas >= 3)
    image(img, 100, 0, 50, 50);
  
  text(count, 170, 40);
  
  //Movimento Bola Altomatico
  if(temp < 0){
    String txt = "Game Over";
    text(txt, width/2 - textWidth(txt)/2, height/2);
  }else if(iniciarJogo && temp > 0){
    bolaX += dX;
    bolaY += dY;
    
    if((bolaX >= width-10) || (bolaX <= 10)) // Borda Direita e Esquerda
      dX = -dX;
    
    if(bolaY <= 10) // Borda Superior
      dY = -dY;
    
    if(bolaY >= height-10){ // Borda Inferior
      vidas --;
      if(vidas > 0){
        iniciarJogo = false;
      }else{
        temp = -180;
      }
    }
    
    // Colisão
    if(((bastaoX < bolaX-10 && bastaoX + 100 > bolaX - 10) || (bastaoX < bolaX+10 && bastaoX + 100 > bolaX + 10)) && (bolaY-10 < bastaoY && bolaY+10 > bastaoY)){
      dY = -dY;
      count ++;
    }
    if(((bastaoX < bolaX-10 && bastaoX + 40 > bolaX - 10) || (bastaoX < bolaX+10 && bastaoX + 40 > bolaX + 10)) && (bolaY-10 < bastaoY && bolaY+10 > bastaoY))
      dX = -dX;
  }else{
    bolaX = bastaoX+50;
    bolaY = bastaoY-10;
    
    String txt = "SPACE para iniciar";
    text(txt, width/2 - textWidth(txt)/2, height/2);
  }
}