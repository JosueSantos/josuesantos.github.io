import processing.sound.*;
SoundFile intro, gameover, nivel, oxi, tent, tiro, tubarao, faltaoxi;

interface JavaScript {
  void playSoundIntro();
  void playSoundTubarao();
  void playSoundNivel();
  void playSoundTentaculo();
  void playSoundOxi();
  void playSoundFaltaOxi();
  void playSoundTiro();
  void playSoundGameover();
}
void bindJavascript(JavaScript js) {
  javascript = js;
}
JavaScript javascript;

//Variáveis de Controle
PImage tesouro1, tesouro2, tesouro3;
int temp = 0, tempAnim = 0, ponto = 0, vidas, recorde = 0;
float widthBarra, oxigenio, dificuldade;
boolean inicioJogo = false;
String txt;

//Variáveis Mergulhador
PImage mergulhador01E, mergulhador01D, mergulhador02E, mergulhador02D, mergulhador03E, mergulhador03D;
int xMergu, yMergu, vMergu;
boolean merguDireita = false;

//Variáveis Arpão
int xArpao, yArpao, vArpao;
boolean tiroArpao = false;

//Variáveis Lancha
PImage lancha01E, lancha01D, lancha02E, lancha02D;
int xLancha, yLancha, vLancha;
boolean lanchaDireita = false;

//Variáveis Mangueira
int xMag, yMag, tempMag = 0, tempWichMag;
boolean magLanch = false;

//Variáveis Tubarão
PImage tuba01E, tuba01D, tuba02E, tuba02D, tubaMerguD, tubaMerguE;
int xTuba, yTuba, vTuba, addVTuba;
boolean tubaDireita = false, tubaWins = false;

//Variáveis Polvo
PImage polvo;
       
void carregarImagens(){
  imageMode(CENTER);
  
  mergulhador01E = loadImage("codigo/namethisgame/mergulhador01E.png");
  mergulhador01D = loadImage("codigo/namethisgame/mergulhador01D.png");
  
  mergulhador02E = loadImage("codigo/namethisgame/mergulhador02E.png");
  mergulhador02D = loadImage("codigo/namethisgame/mergulhador02D.png");
  
  mergulhador03E = loadImage("codigo/namethisgame/mergulhador03E.png");
  mergulhador03D = loadImage("codigo/namethisgame/mergulhador03D.png");
  
  lancha01E = loadImage("codigo/namethisgame/lancha01E.png");
  lancha01D = loadImage("codigo/namethisgame/lancha01D.png");
  
  lancha02E = loadImage("codigo/namethisgame/lancha02E.png");
  lancha02D = loadImage("codigo/namethisgame/lancha02D.png");
  
  polvo = loadImage("codigo/namethisgame/polvo.png");
  
  tuba01E = loadImage("codigo/namethisgame/tubarao01E.png");
  tuba01D = loadImage("codigo/namethisgame/tubarao01D.png");
  
  tuba02E = loadImage("codigo/namethisgame/tubarao02E.png");
  tuba02D = loadImage("codigo/namethisgame/tubarao02D.png");
  
  tubaMerguE = loadImage("codigo/namethisgame/tubamerguE.png");
  tubaMerguD = loadImage("codigo/namethisgame/tubamerguD.png");
  
  tesouro1 = loadImage("codigo/namethisgame/tesouro01.png");
  tesouro2 = loadImage("codigo/namethisgame/tesouro02.png");
  tesouro3 = loadImage("codigo/namethisgame/tesouro03.png");
  
  if(javascript == null) {
    intro = new SoundFile(this, "introducao.mp3");
    tiro = new SoundFile(this, "tiro.mp3");
    oxi = new SoundFile(this, "oxigenio.mp3");
    tubarao = new SoundFile(this, "tubaraomorto.mp3");
    tent = new SoundFile(this, "tentaculo.mp3");
    gameover = new SoundFile(this, "gameover.mp3");
    nivel = new SoundFile(this, "nivel.mp3");
    faltaoxi = new SoundFile(this, "faltaoxigenio.mp3");
  }
}