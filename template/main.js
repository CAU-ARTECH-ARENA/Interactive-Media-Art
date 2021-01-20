function setup() {
  createCanvas(400, 400);
}

function draw() {
  //background(220);
  
  noStroke();
  fill(random(0,255),random(0,255),random(0,255),20)
  
  if(mouseIsPressed)
    circle(mouseX, mouseY, 50)
}
