PImage img01, img02, img03, img04, img05, img06, img07, img08, img09, img10, img11, img12;

int[][] mapa = {
  {  8 ,  10 ,  8 ,  8 ,  10 },
  {  5 ,  6 ,  5 ,  9 ,  12 },
  {  9 ,  10 ,  9 ,  3 ,  6 },
  {  5 ,  6 ,  5 ,  9 ,  9 },
  {  9 ,  10 ,  9 ,  9 ,  6 },
  {  5 ,  6 ,  5 ,  9 ,  2 },
  {  9 ,  10 ,  9 ,  3 ,  6 },
  {  5 ,  6 ,  5 ,  9 ,  9 },
  {  9 ,  10 ,  9 ,  9 ,  6 },
  {  5 ,  6 ,  4 ,  9 ,  9 },
  {  2 ,  4 ,  9 ,  9 ,  6 },
  { 10 ,  7 ,  7 ,  7 ,  7 }
};

void setup(){
  size(600, 600);
  img01 = loadImage("mapa01.png");
  img02 = loadImage("mapa02.png");
  img03 = loadImage("mapa03.png");
  img04 = loadImage("mapa04.png");
  img05 = loadImage("mapa05.png");
  img06 = loadImage("mapa06.png");
  img07 = loadImage("mapa07.png");
  img08 = loadImage("mapa08.png");
  img09 = loadImage("mapa09.png");
  img10 = loadImage("mapa10.png");
  img11 = loadImage("mapa11.png");
  img12 = loadImage("mapa12.png");
  
  mostraMapa();
}

float posX, posY;
void mostraMapa(){
  for(int y = 0; y < 12; y++){
    for(int x = 0; x < 5; x++){
      posicao(x,y);
      switch(mapa[y][x]){
        case 1:
          image(img01, posX, posY, 100, 100);
          break;
        case 2:  
          image(img02, posX, posY, 100, 100);
          break;
        case 3:
          image(img03, posX, posY, 100, 100);
          break;
        case 4:  
          image(img04, posX, posY, 100, 100);
          break;
        case 5:
          image(img05, posX, posY, 100, 100);
          break;
        case 6:  
          image(img06, posX, posY, 100, 100);
          break;
        case 7:
          image(img07, posX, posY, 100, 100);
          break;
        case 8:  
          image(img08, posX, posY, 100, 100);
          break;
        case 9:
          image(img09, posX, posY, 100, 100);
          break;
        case 10:  
          image(img10, posX, posY, 100, 100);
          break;
        case 11:
          image(img11, posX, posY, 100, 100);
          break;
        case 12:  
          image(img12, posX, posY, 100, 100);
          break;
      }
    }
  }
}
void posicao(int x, int y){
  if(y % 2 == 0){
    posX = (x + 0.5)*100;
    posY = y*50-10*y;
  }else{
    posX = x*100;
    posY = y*50-10*y;
  }
}