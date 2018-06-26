void atirarArpao(){
  if(tiroArpao){
    if(yArpao == yMergu - 20){
      tiro.play();
      tiro.amp(0.25);
    }
    noTint();
    yArpao -= vArpao;
    
    if(yArpao < height/5)
      tiroArpao = false;
    
    image(arpao, xArpao, yArpao, 10, 40, wDArpao, 0, wEArpao, arpao.height);
  }
}