void atirarArpao(){
  if(tiroArpao){
    if(yArpao == yMergu - 20){
      tiro.play();
      tiro.amp(0.25);
    }
    fill(255);
    ellipse(xArpao, yArpao, 5, 5);
    yArpao -= vArpao;
    
    if(yArpao < height/10)
      tiroArpao = false;
  }
}