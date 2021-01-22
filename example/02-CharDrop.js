let cam;
let string = 'ABCDEFG HIJKLMN123456789 processing code for image processing with python and javascript, C# in ARENA2021, Art and Technology, CAU';

function setup() {
  createCanvas(640, 480);
  frameRate(30);
  
  cam = createCapture(VIDEO);
  cam.size(640,480);
  cam.hide();
}

let ack = 1;
let index;
let c;

function draw() {
  ack = (ack > 200) ? 1 : ack+1;
  index = 0;
  
  c = color(0,0,0)
  for (let i=0; i<=width; i+=width/90)
  {
    for (let j=0; j<=height+45; j+=height/45)
    {
      c = cam.get(i, j);
      let d = map(brightness(c), 0, 255, 60, 0);
      textSize(d+40);
      fill(c);
      index++;
      text(string.charAt((index+ack)%string.len), i, j);
    }
  }
  
  
  //image(cam, 0, 0);
}
