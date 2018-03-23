/// MAMI ///
/// Josue dos Santos ///

import controlP5.*;

ControlP5 gui;
int horizontal = 0;
int vertical = 0;

int vH = 0;
int vV = 0;

void setup(){
  size(800, 600);
  rectMode(CENTER);
  
  gui = new ControlP5(this);
  
  gui.addSlider("horizontal")
    .setRange(1, 8)
    .setValue(horizontal)
    .setPosition(600, 90)
    .setSize(130, 20);
  
  gui.addSlider("vertical")
    .setRange(1, 6)
    .setValue(vertical)
    .setPosition(600, 130)
    .setSize(130, 20);
  
  background(100);
}

void draw(){
  if(vH != horizontal || vV != vertical){
    kandinskyMethod(horizontal, vertical);
    vH = horizontal;
    vV = vertical;
  }
  fill(100);
  rect(687, 121, 203, 88);
}

void circulo(int x, int y, int r){
  corAleatoria();
  ellipse(x, y, r*2, r*2);
}

void bloco(int x, int y, int l){
  corAleatoria();
  rect(x, y, l, l);
  
  int quantCirculo = (int) random(2, 4);
  int tamanhoCirculo = l/2;
  
  for(int i = 0; i < quantCirculo; i++){
    circulo(x,y,tamanhoCirculo);
    tamanhoCirculo = (int) random(15, (tamanhoCirculo - 10));
  }
}

void corAleatoria(){
  fill( random(255), random(255), random(255) );
}

void kandinskyMethod(int h, int v){
  background(100);
  
  for(int i = 0; i < h; i++){
    for(int j = 0; j < v; j++){
      int x = 50 + 100 * i;
      int y = 50 + 100 * j;
      bloco(x, y, 100);
    }
  }
}