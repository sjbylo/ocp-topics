docker login docker.io -u sjbylo

docker build . -t sjbylo/netcat-echo

docker push sjbylo/netcat-echo

