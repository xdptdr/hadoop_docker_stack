#!/bin/bash

for hash in `docker ps -a | awk '{print $1,$2}' | grep 'hadoop$' | cut -f 1 -d ' '` ; do
	docker container rm $hash
done

for i in `docker images --filter="dangling=true" -q`; do
	for hash in `docker ps -a | awk '{print $1,$2}' | grep "$i"'$' | cut -f 1 -d ' '` ; do
		docker container rm $hash
	done
	docker image rm $i
done


docker image inspect hadoop >/dev/null && docker image rm hadoop
docker build --no-cache=true -t hadoop .

