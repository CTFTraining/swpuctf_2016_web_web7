FROM ubuntu
COPY files /app
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install file build-essential zlib1g-dev libbz2-dev libreadline-dev libssl1.0-dev -y &&\
    #Install basic build enviroment
    mkdir /Python2 &&\
    tar xJvf /app/Python-2.7.5.tar.xz -C / &&\
    cd /Python-2.7.5 &&\
    ./configure &&\
    make -j4 &&\
    make install &&\
    #Install python 2.7.5
    tar xzvf /app/redis-2.6.14.tar.tar.gz -C / &&\
    cd /redis-2.6.14 &&\
    make -j4 &&\
    make install &&\
    #Install redis 2.6.14
    python2 /app/get-pip.py &&\
    pip install redis cherrypy &&\
    #Install cherrypy web framework
    apt-get remove file build-essential zlib1g-dev libbz2-dev libreadline-dev libssl1.0-dev -y &&\
    apt-get autoremove -y &&\
    #Remove build enviroment
    apt-get install -y libssl1.0.0 &&\
    #Cherrypy needs hashlib
    rm -rfv /Python-2.7.5 &&\
    rm -rfv /redis-2.6.14 &&\
    rm -rfv /app/get-pip.py /app/Python-2.7.5.tar.xz /app/redis-2.6.14.tar.tar.gz &&\
    apt clean all
    #Final clean
EXPOSE 8080
CMD ["/bin/bash","/app/src/docker-daemon"]

