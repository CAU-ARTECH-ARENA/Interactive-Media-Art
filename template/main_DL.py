import cv2
import tensorflow as tf
import numpy as np
import re

print(cv2.__version__)
print(tf.__version__)

with open("face_label_map.pbtxt","rt") as f: #Absolute Path
    pb_classes = f.read().rstrip('\n').split('\n')
    
    classes_label = dict()
    for i in range(0, len(pb_classes), 5):
        pb_classId = int(re.findall("\d+" , pb_classes[i+2])[0])
        pattern = "display_name: \"(.*?)\""
        pb_text = re.search(pattern, pb_classes[i+3])
        classes_label[pb_classId] = pb_text.group(1)
        
with tf.io.gfile.GFile("frozen_inference_graph.pb", 'rb') as f: #Absolute Path
    graph = tf.compat.v1.GraphDef()
    graph.ParseFromString(f.read())

with  tf.compat.v1.Session() as sess:
    tf.import_graph_def(graph, name="")

    capture = cv2.VideoCapture(0)
    capture.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
    capture.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

    while True:
        ret, frame = capture.read()
        
        if(capture.get(cv2.CAP_PROP_POS_FRAMES) == capture.get(cv2.CAP_PROP_FRAME_COUNT)):
            break
        
        input_img = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        
        num_detections, scores, classes, boxes = sess.run(
            fetches=[sess.graph.get_tensor_by_name("num_detections:0"),
                     sess.graph.get_tensor_by_name("detection_scores:0"),
                     sess.graph.get_tensor_by_name("detection_classes:0"),
                     sess.graph.get_tensor_by_name("detection_boxes:0")],
        feed_dict={
            "image_tensor:0":input_img.reshape(1,input_img.shape[0],
                                               input_img.shape[1],
                                               input_img.shape[2])}
        )
        
        rows, cols, _ = frame.shape
        for i in range(int(num_detections[0])):
            class_id = int(classes[0][i])
            score = scores[0][i]
            box = boxes[0][i]
            
            if score > 0.6:
                x1 = int(box[1] * cols)
                y1 = int(box[0] * rows)
                x2 = int(box[3] * cols)
                y2 = int(box[2] * rows)
                
                cv2.putText(frame, classes_label[class_id] + ":" + str(int(score)),
                            (x1, y1 - 5), cv2.FONT_HERSHEY_COMPLEX,
                            1.0, (0, 0, 255), 1)
                cv2.rectangle(frame, (x1, y1), (x2, y2), (255, 0, 0), 5)
                
        cv2.imshow("Face Detection", frame)
        if cv2.waitKey(33) == ord('q'): break

capture.release()
cv2.destroyAllWindows()
