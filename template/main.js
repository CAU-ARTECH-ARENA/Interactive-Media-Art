let cam;

function setup() {
  createCanvas(640, 480);
  frameRate(30);
  
  cam = createCapture(VIDEO);
  cam.size(640,480);
  cam.hide();
}

function draw() {
    image(cam, 0, 0);
}
