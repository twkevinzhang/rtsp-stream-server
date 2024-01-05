# rtsp-stream-server
A simple RTSP stream server with YOLOv3 (darknet)

提供一個簡單的 RTSP stream server，並且可以在影像上使用預訓練的 [yolov3-tiny.weights] 標註物件位置。

ffmpeg 製作 RTSP stream 給 rtsp-stream-server, 
rtsp-stream-server 在 localhost:8554/stream 發布 stream, 
yolo-python-rtsp 接收 stream 從 0 到 100 frame, 並輸出標記物至 output 資料夾。

## Prerequisites
 - docker

## Start
```
make up
```
then access rtsp://localhost:8554/stream

## Stop
```
make down
```

[yolov3-tiny.weights]: https://pjreddie.com/media/files/yolov3-tiny.weights
