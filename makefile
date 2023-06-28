.PHONY: install
install:
	cd ./yolo-python-rtsp && \
		cp ../yolo-python-rtsp-requirements.txt ./requirements.txt && \
		python3 -m venv .venv && \
		. .venv/bin/activate; pip install -Ur ./requirements.txt && \
		wget -nc https://pjreddie.com/media/files/yolov3-tiny.weights

.PHONY: run
run:
	docker run -d --name rtsp-stream-server --rm -it -v $(PWD)/mediamtx.yml:/mediamtx.yml -p 8554:8554 aler9/rtsp-simple-server

.PHONY: stream
stream:
	ffmpeg -re -stream_loop -1 -i ./h264.mp4 -f rtsp -rtsp_transport tcp rtsp://localhost:8554/stream

.PHONY: stop
stop:
	docker stop rtsp-stream-server
	docker rm rtsp-stream-server

.PHONY: detect
detect:
	cd ./yolo-python-rtsp && \
		. .venv/bin/activate; python yolo_opencv.py --input rtsp://localhost:8554/stream --framestart 0 --framelimit 100 --config cfg/yolov3-tiny.cfg --weights yolov3-tiny.weights --classes cfg/yolov3.txt

.PHONY: play
play:
	ffplay rtsp://localhost:8554/stream