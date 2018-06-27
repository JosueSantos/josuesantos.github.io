import controlP5.*;
ControlP5 controlP5;

PImage imgOriginal;
PImage imgDestino = createImage(600, 400, HSB);
PImage imgRuido = createImage(600, 400, HSB);
color corOriginal, corDestino, corRuido;
float h, s, b, matiz, saturacao, brilho, quantRuido, nh, ns, nb;

void setup(){
  size(1200, 400);
  imgOriginal = loadImage("original.jpg");
  
  colorMode(HSB, 360, 100, 100);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("matiz")
     .setPosition(590,20)
     .setSize(20,100)
     .setRange(0,100);
     
   controlP5.addSlider("saturacao")
     .setPosition(590,140)
     .setSize(20,100)
     .setRange(0,100);
     
   controlP5.addSlider("brilho")
     .setPosition(590,260)
     .setSize(20,100)
     .setRange(0,100);
     
   controlP5.addSlider("quantRuido")
     .setPosition(290,260)
     .setSize(40,100)
     .setRange(0,100);
}

void draw(){
  processaImagem();
  ruido();
  
  image(imgRuido, 0, 0);
  image(imgDestino, 600, 0);
}

void ruido(){
  imgRuido = loadImage("original.jpg");
  
  float rui = map(quantRuido, 0, 100, 100, 600*400);
  
  for (int i=0; i < rui; i++) {
    int x = (int) random(0, 600);
    int y = (int) random(0, 400);
    
    corOriginal = imgOriginal.get(x,y);
    h = hue(corOriginal);
    s = saturation(corOriginal);
    b = brightness(corOriginal);
    
    nh = map(random(0,100), 0, 100, 0, 2);
    ns = map(random(0,100), 0, 100, 0, 2);
    nb = map(random(0,100), 0, 100, 0, 2);
    
    corRuido = color(nh*h, ns*s, nb*b);
    imgRuido.set(x,y,corRuido);
  }
}

void processaImagem() {
  for (int x=0; x<600; x++) {
    for (int y=0; y<400; y++) {
      corOriginal = imgOriginal.get(x,y);
      h = hue(corOriginal);
      s = saturation(corOriginal);
      b = brightness(corOriginal);
      
      nh = map(matiz, 0, 100, -0.5, 2.5);
      ns = map(saturacao, 0, 100, -0.5, 2.5);
      nb = map(brilho, 0, 100, -0.5, 2.5);
      
      corDestino = color(nh*h, ns*s, nb*b);
      imgDestino.set(x,y,corDestino);
    }
  }
}