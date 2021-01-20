import processing.video.*;
import java.awt.*;

String string;
PFont font;
PImage img;

Capture cam;
Rectangle[] faces;

void setup() {
  colorMode(RGB);
  size(640, 480);
  string = "ABCDEFG HIJKLMN123456789 processing code for image processing with python and javascript, C# in ARENA2021, Art and Technology, CAU";
  //font = loadFont("Arial-Black-48.vlw");
  cam = new Capture(this, 640, 480);
  
  cam.start();
}

int ack=1;
int index;

void draw() {
  //image(cam, 0, 0);
  ack= (ack > 200) ? 1 : ack+1;
  index=0; 
  color c;
  for (int i=0; i<=width; i+=width/90)
  {
    for (int j=0; j<=height+45; j+=height/45)
    {
      c = cam.get(i, j);
      float d = map(brightness(c), 0, 255, 60, 0);
      textSize(d+40);
      fill(c);
      index++;
      text(string.charAt((index+ack)%string.length()), i, j);
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}
