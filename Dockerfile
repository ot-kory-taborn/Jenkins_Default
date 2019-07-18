FROM jenkins/jenkins:lts
USER root
RUN curl -sSL https://get.docker.com/ | sh &&\
    usermod -aG docker jenkins &&\
    usermod -aG root jenkins
USER jenkins
VOLUME ["/var/run/docker.sock"]
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
