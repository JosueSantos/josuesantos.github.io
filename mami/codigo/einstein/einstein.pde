//MAMI
//Josué Santos

PImage img;

void setup(){
  img = loadImage("einstein.jpg");
  //img = loadImage("cinza.jpg");
  //img = loadImage("einsteinBrilho.jpg");
  //img = loadImage("cinzaBrilho.jpg");
  //img = loadImage("einsteinContraste.jpg");
  //img = loadImage("cinzaContraste.jpg");
  
  println("Media de tons é", mediaT( img, img.width, img.height));
  println("Desvio Padrão é ",desvioT( img, img.width, img.height));
}

float mediaT( PImage img, int widthImg, int heightImg){
  float tom, somaTons = 0;
  
  for(int x = 0; x < widthImg; x++){
    for(int y = 0; y < heightImg; y++){
      color cor = img.get(x, y);
      tom = red(cor);
      
      somaTons += tom;
    }
  }
  
  return somaTons / ( widthImg * heightImg );
}

float desvioT( PImage img, int widthImg, int heightImg){
  float tom, varianca = 0, mediaTons = mediaT( img, widthImg, heightImg);
  
  for(int x = 0; x < widthImg; x++){
    for(int y = 0; y < heightImg; y++){
      color cor = img.get(x, y);
      tom = red(cor);
      
      varianca += pow( tom - mediaTons, 2);
    }
  }
  
  varianca = varianca / ( widthImg * heightImg );
  return sqrt( varianca );
}