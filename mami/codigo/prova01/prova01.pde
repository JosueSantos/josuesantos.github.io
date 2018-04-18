//MAMI
//Josué
int x = 50, y = 50, altura = 50;

void setup(){
  size(600,600);
  background(187,46,46);
}

void draw(){
  cuboKoffka(x, y);
}

void cuboKoffka(int x, int y){
  fill(50);
  quad( x, y, x-altura, y - altura/2, x, y - altura, x + altura ,y - altura/2 );
  fill(150);
  quad( x, y, x, y + altura, x - altura, y + altura/2, x - altura ,y - altura/2 );
  fill(200);
  quad( x, y, x, y + altura, x + altura, y + altura/2, x + altura ,y - altura/2 );
}
void keyPressed(){
  switch(keyCode){
    case RIGHT:
      x += altura*2;
      cuboKoffka(x, y);
      break;
    case DOWN:
      y += altura*3/2;
      x += altura;
      cuboKoffka(x, y);
      break;
    case LEFT:
      y += altura*3/2;
      x -= altura;
      cuboKoffka(x, y);
      break;
    case 38:
      y -= altura*3/2;
      x += altura;
      cuboKoffka(x, y);
      break;
  }
}