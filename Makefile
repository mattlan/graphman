.PHONY: up debug down restart clean cleanall tcpdump shell

# start/create containers detached
up:
	@docker-compose up -d

# start/create containers without detaching
debug:
	@docker-compose up

# stop containers
down:
	@docker-compose kill

# restart container
# example: CONTAINER=example make restart
restart:
	@docker-compose restart $(CONTAINER)

# stop and delete containers
clean:
	@docker-compose down

# stop and delete containers and volumes
cleanall:
	@docker-compose down -v

# tcpdump container
# example: CONTAINER=example ARGS=-v make tcpdump
# default: eth0
INTF?=eth0
tcpdump:
	@docker run --tty --rm --net=container:$(CONTAINER) tcpdump tcpdump -i $(INTF) $(ARGS)

# get shell on container
# example: CONTAINER=example BIN=sh make shell
# default: bash
BIN?=bash
shell:
	@docker exec -it $(CONTAINER) $(BIN)
