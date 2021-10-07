# docker-grafana-graphite makefile

# Environment Varibles
CONTAINER = graphite-dashboard

.PHONY: up

prep :
	mkdir -p \
		data/whisper \
		data/elasticsearch \
		data/grafana \
		log/graphite \
		log/graphite/webapp \
		log/elasticsearch

pull :
	docker-compose pull

up : prep pull
	docker-compose -f docker-compose.yml up -d

down :
	docker-compose -f docker-compose.yml down

shell :
	docker exec -ti $(CONTAINER) /bin/sh

tail :
	docker logs -f --tail=10 $(CONTAINER)
