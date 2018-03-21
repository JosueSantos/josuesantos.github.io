/// MAMI ///
/// Josué dos Santos ///

int n;
float xMeio;
float yMeio;

void setup() {
  size(600, 600);
  
  xMeio = width/2;
  yMeio = height/2;
}

void draw() { //<>//
  n = 5;
  background(0);
   //<>//
  int t = tamanhoOcupado(n);
  for(int i = 0; i < n; i++){
    quadrado(xMeio - t, yMeio);
    t -= 60;
  }
  
  ellipse(xMeio,yMeio,10,10);
}

void quadrado(float x, float y){
  y -= 25;
  rect(x, y, 50, 50);
}

int tamanhoOcupado(int n){
  return n * 25 + ((n - 1) * 5);
}