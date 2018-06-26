import processing.sound.*;
SoundFile intro, gameover, nivel, oxi, tent, tiro, tubarao, faltaoxi;

//Variáveis de Controle
PImage menu, fundo, mar1, mar2, tesouro1, tesouro2, tesouro3;
int tempAnim, temp, vidas, ponto, recorde, tempTiro, tempMang = 0, tempTuba, tempPolvoDor;
float widthBarra, oxigenio, dificuldade;
boolean inicioJogo = true, game = true, red = false, vitoria = false;
String txt;

//Variáveis Mergulhador
PImage mergulhador1, mergulhador2, mergulhador3, mergulhadorTiro1, mergulhadorTiro2, mergulhadorTiro3, mergulhadorTiro4, mergulhadorTiro5, vitoriaMergu;
int xMergu, yMergu, vMergu, wDMergu, wEMergu;
boolean  atirando, merguDireita, mergulhadorDevorado;

//Variáveis Arpão
PImage arpao;
int xArpao, yArpao, vArpao, wDArpao, wEArpao;
boolean tiroArpao = false;

//Variáveis Lancha
PImage barco, barco01, barco02, barco03, barco04, barco05, barco06, barco07, barco08, barco09, barco10, mangueira;
int xBarco, yBarco, vBarco, wDBarco, wEBarco, xMang;
boolean  barcoDireita, LanceMangueira, fundoMangueira;

//Variáveis Tubarão
PImage tuba1, tuba2, tuba3, tubaMergu1, tubaMergu2, tubaMergu3, tubaMergu4;
int xTuba, yTuba, vTuba, wDTuba, wETuba;
boolean  tubaDireita, devorado;

//Variáveis Polvo
PImage polvo1, polvo2, polvo3, polvo4, pontaTentaculo, tentaculo, tentaculoCompleto, fumaca;
int quantTentaculos = 8, tamanhoTentaculos = 13, tintaFundo = 160, novoTentaculoTemp, pv = 0;
int[] initPosiPolvo = { 100, 170, 250, 330, 475, 550, 630, 700};
int[][] tentaculos = new int[tamanhoTentaculos * quantTentaculos][6];
// -- tentaculos[][ x, y, movimento, vivo, lider, movimentoAnterior ]
boolean polvoDor, toqueFundo;;
       
void carregarImagens(){
  imageMode(CENTER);
  
  mergulhador1 = loadImage("codigo/namethisgame3/img/mergulhador1.png");
  mergulhador2 = loadImage("codigo/namethisgame3/img/mergulhador2.png");
  mergulhador3 = loadImage("codigo/namethisgame3/img/mergulhador3.png");
  
  mergulhadorTiro1 = loadImage("codigo/namethisgame3/img/mergulhadorTiro1.png");
  mergulhadorTiro2 = loadImage("codigo/namethisgame3/img/mergulhadorTiro2.png");
  mergulhadorTiro3 = loadImage("codigo/namethisgame3/img/mergulhadorTiro3.png");
  mergulhadorTiro4 = loadImage("codigo/namethisgame3/img/mergulhadorTiro4.png");
  mergulhadorTiro5 = loadImage("codigo/namethisgame3/img/mergulhadorTiro5.png");
  
  vitoriaMergu = loadImage("codigo/namethisgame3/img/vitoria.png");
  
  arpao = loadImage("codigo/namethisgame3/img/arpao.png");
  
  barco = loadImage("codigo/namethisgame3/img/barco01.png");
  barco01 = loadImage("codigo/namethisgame3/img/barco02.png");
  barco02 = loadImage("codigo/namethisgame3/img/barco03.png");
  barco03 = loadImage("codigo/namethisgame3/img/barco04.png");
  barco04 = loadImage("codigo/namethisgame3/img/barco05.png");
  barco05 = loadImage("codigo/namethisgame3/img/barco06.png");
  barco06 = loadImage("codigo/namethisgame3/img/barco07.png");
  barco07 = loadImage("codigo/namethisgame3/img/barco08.png");
  barco08 = loadImage("codigo/namethisgame3/img/barco09.png");
  barco09 = loadImage("codigo/namethisgame3/img/barco10.png");
  barco10 = loadImage("codigo/namethisgame3/img/barco11.png");
  
  mangueira = loadImage("codigo/namethisgame3/img/mangueira.png");
  
  tuba1 = loadImage("codigo/namethisgame3/img/tuba1.png");
  tuba2 = loadImage("codigo/namethisgame3/img/tuba2.png");
  tuba3 = loadImage("codigo/namethisgame3/img/tuba3.png");
  
  tubaMergu1 = loadImage("codigo/namethisgame3/img/tubaMergu1.png");
  tubaMergu2 = loadImage("codigo/namethisgame3/img/tubaMergu2.png");
  tubaMergu3 = loadImage("codigo/namethisgame3/img/tubaMergu3.png");
  tubaMergu4 = loadImage("codigo/namethisgame3/img/tubaMergu4.png");
  
  polvo1 = loadImage("codigo/namethisgame3/img/polvo1.png");
  polvo2 = loadImage("codigo/namethisgame3/img/polvo2.png");
  polvo3 = loadImage("codigo/namethisgame3/img/polvo3.png");
  polvo4 = loadImage("codigo/namethisgame3/img/polvo4.png");
  
  pontaTentaculo = loadImage("codigo/namethisgame3/img/pontaTentaculo.png");
  tentaculo = loadImage("codigo/namethisgame3/img/tentaculo.png");
  tentaculoCompleto = loadImage("codigo/namethisgame3/img/tentaculoCompleto.png");
  
  fumaca = loadImage("codigo/namethisgame3/img/fumaca.png");
  
  tesouro1 = loadImage("codigo/namethisgame3/img/tesouro1.png");
  tesouro2 = loadImage("codigo/namethisgame3/img/tesouro2.png");
  tesouro3 = loadImage("codigo/namethisgame3/img/tesouro3.png");
  
  menu = loadImage("codigo/namethisgame3/img/menu.png");
  fundo = loadImage("codigo/namethisgame3/img/fundo.png");
  
  mar1 = loadImage("codigo/namethisgame3/img/mar1.png");
  mar2 = loadImage("codigo/namethisgame3/img/mar2.png");
  
  intro = new SoundFile(this, "introducao.mp3");
  tiro = new SoundFile(this, "tiro.mp3");
  oxi = new SoundFile(this, "oxigenio.mp3");
  tubarao = new SoundFile(this, "tubaraomorto.mp3");
  tent = new SoundFile(this, "tentaculo.mp3");
  gameover = new SoundFile(this, "gameover.mp3");
  nivel = new SoundFile(this, "nivel.mp3");
  faltaoxi = new SoundFile(this, "faltaoxigenio.mp3");
}