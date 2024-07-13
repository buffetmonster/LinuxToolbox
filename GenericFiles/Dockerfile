FROM ubuntu

RUN apt-get update

RUN apt-get install git -y

WORKDIR /autostartjob

COPY dockeralive.sh .

RUN chmod +x dockeralive.sh

CMD ["/autostartjob/dockeralive.sh"]