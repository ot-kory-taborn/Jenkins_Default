FROM jenkins/jenkins:lts
USER root

# Using multiple RUN commands to try to leverage image layer caching
RUN curl -sSL https://get.docker.com/ | sh &&\
    usermod -aG docker jenkins &&\
    usermod -aG root jenkins
RUN curl -O https://bootstrap.pypa.io/get-pip.py &&\
    python get-pip.py &&\
    pip install awscli --upgrade
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
    apt-get update && apt-get install -y nodejs &&\
    npm i -g typescript &&\
    npm i -g aws-cdk
RUN aws configure set region us-east-1