# video-filter
*Create Video Filter with Face Tracking using opencv like Snow App and Zoom Func.*

**😄 Our Artwork is [Here](artwork)**

## Environment

#### Python

- **IDE : [anaconda3](https://anaconda.org/)**
- **python >= 3.8** with Virtual Environment

#### Processing

- **IDE : [processing3](https://processing.org/download/) >= 3.5.4** 

#### C#

- **IDE : [Visual Studio](https://visualstudio.microsoft.com/ko/)**

#### JavaScript

- **IDE : [Web Editor](https://editor.p5js.org/)**
- **p5.js == 1.2.0**


## Getting Started

*Template with basic code to help you get started quickly of this repository is located in the [template folder](https://github.com/CAU-ARTECH-ARENA/video-filter/tree/main/template)*

#### Python (Anaconda)

- DL : [Tensorflow Pre-trained Model](http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_11_06_2017.tar.gz) for Face Tracking
<br>[Object Detection](https://github.com/tensorflow/models/tree/master/research/object_detection/g3doc) 
<!-- https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/tf2_detection_zoo.md -->

- CV : 

1. Install Anaconda : [https://www.anaconda.com/products/individual](https://www.anaconda.com/products/individual) (Check your OS.)

2. Open 'Anaconda Prompt'
```dash
(base) C:> conda create -n [env_name] python=3.8
(base) C:> activate [env_name]
([env_name]) C:> pip install opencv-python==4.0.0.21
```

3. Open 'Anaconda Navigator' > Applications on [env_name] > Install and Launch Jupyter Notebook

4. Create Python3 files and Run following Code
<br>**(fix 'haarcascade_frontalface_default.xml' file to Absolute Path)**
```python
import numpy as np
import cv2
 
detector = cv2.CascadeClassifier('haarcascade_frontalface_default.xml') #Absolute Path
cap = cv2.VideoCapture(0)
 
while (True):
    ret, img = cap.read()
    
    cv2.imshow('frame', img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
 
cap.release()
cv2.destroyAllWindows()
```

5. Imagine and Realizae Creative Idea as your Python Code! 

#### Processing

1. Install IDE : [https://processing.org/download/](https://processing.org/download/) (Check your OS.)

2. Open IDE and Run following Code (Mouse Click!)
 ```processing
 void setup() {
  size(400, 400);
}

void draw() {
  //background(220);
  
  noStroke();
  fill(random(0,255),random(0,255),random(0,255),20)
  
  if(mousePressed)
    circle(mouseX, mouseY, 50)
}
 ```
 
 3. Imagine and Realizae Creative Idea as your Processing Code! 

#### C#

#### JavaScript

1. Open WebEditor : [https://editor.p5js.org/](https://editor.p5js.org/)

2. Run following Code (Mouse Click!)
```javascript
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
```
3. Imagine and Realizae Creative Idea as your JavaScript Code! 

<!--
#### Installation Python IDE
-->

## Requirement

- **camera (connected with PC, or webcam)**

**What is OpenCV ->** [https://opencv.org/](https://opencv.org/)

Quick Setup : [setupfile](https://github.com/CAU-ARTECH-ARENA/video-filter/tree/main/exe.sh)

## Applications

<p align="center"><img src="https://github.com/CAU-ARTECH-ARENA/video-filter/blob/main/imgs/ref_01.png" width="50%" height="50%"></p>

## Reference Image

<p align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/8/87/OfxOpenCV.png"></p>
