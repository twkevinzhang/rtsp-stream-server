# rtsp-stream-server
A simple RTSP stream server with YOLOv3 (darknet)

## Prerequisites
 - ffmpeg
 - docker

## Clone
```
git clone --recurse-submodules https://github.com/neslxzhen/rtsp-stream-server
```

## Installation
```
make install
```

## Usage
```
make run
make stream
```

## Stop
CTRL+C and input
```
make stop
```

## IndexError
ref: https://github.com/foschmitz/yolo-python-rtsp/issues/7
```
Traceback (most recent call last):
  File "/home/bucketanalytics/kevin-lab/rtsp-stream-server/yolo-python-rtsp/yolo_opencv.py", line 172, in <module>
    frame = detect(frame)
  File "/home/bucketanalytics/kevin-lab/rtsp-stream-server/yolo-python-rtsp/yolo_opencv.py", line 87, in detect
    outs = net.forward(get_output_layers(net))
  File "/home/bucketanalytics/kevin-lab/rtsp-stream-server/yolo-python-rtsp/yolo_opencv.py", line 50, in get_output_layers
    output_layers = [layer_names[i[0] - 1] for i in net.getUnconnectedOutLayers()]
  File "/home/bucketanalytics/kevin-lab/rtsp-stream-server/yolo-python-rtsp/yolo_opencv.py", line 50, in <listcomp>
    output_layers = [layer_names[i[0] - 1] for i in net.getUnconnectedOutLayers()]
IndexError: invalid index to scalar variable.
```
change `yolo_opencv.py` line 50 to `output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]`
