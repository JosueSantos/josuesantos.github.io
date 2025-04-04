/// MAMI ///
/// Josue dos Santos ///

int bastaoX = 0;
int bastaoY;

int bolaX;
int bolaY;
int dX = 5;
int dY = 5;

int count = 0;
boolean iniciarJogo = false;

PImage img;
int vidas;

float temp;

//int [][] cor = {
//  {255, 0, 0},
//  {255, 0, 0},
//  {255, 255, 0},
//  {255, 255, 0},
//  {0, 255, 0},
//  {0, 255, 0},
//  {0, 0, 255},
//  {0, 0, 255},
//};

int linhasBlock = 8;
int colunasBlock = 8;
int [][] map = new int [(linhasBlock * colunasBlock)][3];

void setup(){
 size(800, 450);
 fill(255);
 textSize(30);
 bastaoX = width/2-50;
 bastaoY = height - 50;
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
    
    dX = 5;
    dY = 5;
    criarMapa();
  }else{
    temp ++;
  }
  
  // Interface
  fill(255);
  rect(bastaoX , bastaoY, 100, 20);
  fill(128);
  ellipse(bolaX , bolaY, 10, 10);
  
  fill(0, 255, 0);
  for(int i = 0; i < map.length; i++){
    if(map[i][2] == 1){
      //int xx = i/8;
      //fill(cor[xx][0], cor[xx][1], cor[xx][2]);
      rect(map[i][0] , map[i][1], 100, 20);
    }
  }
  
  if(vidas >= 1)
    image(img, 0, 0, 50, 50);
  if(vidas >= 2)
    image(img, 50, 0, 50, 50);
  if(vidas >= 3)
    image(img, 100, 0, 50, 50);
  
  fill(255);
  text(count, 170, 40);
  
  //Movimento Bola Altomatico
  if(temp < 0){
    fill(255);
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
    colision(bastaoX, bastaoY);
    
    int victory = 0;
    for(int i = 0; i < map.length; i++){
      if(map[i][2] == 1){
        victory = 1;
        if(colision(map[i][0], map[i][1])){
          count ++;
          map[i][2] = 0;
        }
      }
    }
    
    if(victory == 0){
      criarMapa();
      vidas += 1;
      dX += 2;
      dY += 2;
    }
  }else{
    bolaX = bastaoX+50;
    bolaY = bastaoY-5;
    
    String txt = "SPACE para iniciar";
    text(txt, width/2 - textWidth(txt)/2, height/2);
  }
}

boolean colision(int x, int y){
  if (bolaX <= x + 100 && bolaX >= x && bolaY <= y + 20 && bolaY >= y){
    dY = -dY;
    return true;
  }
  
  return false;
}

void criarMapa(){
  // x, y, bollean(0,1)
  int xBlock;
  int yBlock = 50;
  int countBlock = 0;
  
  for(int i = 0; i < linhasBlock; i++){
    xBlock = 0;
    for(int j = 0; j < colunasBlock; j++){
      
      int [] arr = {xBlock, yBlock, 1};
      map[countBlock] = arr;
      
      xBlock += 100;
      countBlock ++;
    }
    yBlock += 20;
  }
}