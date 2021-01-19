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
  filter(THRESHOLD);
}

void captureEvent(Capture c) {
  c.read();
}
