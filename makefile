.PHONY: up
up:
	docker compose -p rtsp-stream-server up -d

.PHONY: down
down:
	docker compose -p rtsp-stream-server down
