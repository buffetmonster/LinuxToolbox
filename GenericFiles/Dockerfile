FROM ubuntu

#expose port
EXPOSE 5000

# Set the time zone non-interactively
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update

RUN apt-get install git -y

RUN apt-get install git silversearcher-ag python3 python3-venv net-tools wget tree -y

WORKDIR /autostartjob

COPY dockeralive.sh .

RUN chmod +x dockeralive.sh

CMD ["/autostartjob/dockeralive.sh"]