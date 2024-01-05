FROM python:3.10
RUN apt-get -y update && apt-get install -y wget git python3-opencv ffmpeg
RUN pip3 install numpy opencv-python imageio-ffmpeg==0.4.8
WORKDIR home/
RUN git clone https://github.com/foschmitz/yolo-python-rtsp.git
WORKDIR yolo-python-rtsp/
RUN sed -i '50c \    output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]' yolo_opencv.py
RUN sed -i '116d' yolo_opencv.py
RUN wget -nc https://github.com/smarthomefans/darknet-test/raw/master/yolov3-tiny.weights
ENTRYPOINT ["python", "yolo_opencv.py", "--input", "rtsp://rtsp-stream-server:8554/stream", "--framestart", "0", "--framelimit", "100", "--config", "cfg/yolov3-tiny.cfg", "--weights", "yolov3-tiny.weights", "--classes", "cfg/yolov3.txt"]
