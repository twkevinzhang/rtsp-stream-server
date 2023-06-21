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