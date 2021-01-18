void setup(){
  size(800,600);
  background(0);
}

int ack;

void draw(){
  fill(0);
  noStroke();

  if(mousePressed){
    ack = (ack >= 200) ? ack+10 : 10;
    rect(mouseX, mouseY, 10 + ack, 10 + ack);
  }
  
  println("X Position : " + mouseX + "Y Position : " + mouseY); 
}
