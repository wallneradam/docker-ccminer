FROM nvidia/cuda:6.5-runtime

COPY dist/bin/ccminer /usr/local/bin/ccminer

RUN apt-get update \
 && apt-get -y install libcurl3 libgomp1 \
 && apt-get clean

CMD ccminer
