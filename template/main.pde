import processing.video.*;
import gab.opencv.*;
import java.awt.*;

Capture cam;
OpenCV opencv;
Rectangle[] faces;

void setup() {
  size(640, 480);
  frameRate(30);
  cam = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  cam.start();
}

int ack;

void draw() {
  opencv.loadImage(cam);
  image(cam, 0, 0);
  
  if(mousePressed){
    ack = (ack > 255+1) ? 255+1 : ack+30;
  } else { ack = 0; }
  
  stroke(255-ack,ack,0);
  strokeWeight(2);
  noFill();
  faces = opencv.detect();
  for (int i=0; i<faces.length; i++) {
    rect(faces[i].x, faces[i].y, 
      faces[i].width, faces[i].height);
    println("Face Detected "+ i+1, faces[i].x, faces[i].y, 
      faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  switch(key) {
  case '1': 
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
    break;
  case '2' :
    opencv.loadCascade(OpenCV.CASCADE_EYE);
    break;
  case '3' :
    opencv.loadCascade(OpenCV.CASCADE_NOSE);
    break;
  }
}
