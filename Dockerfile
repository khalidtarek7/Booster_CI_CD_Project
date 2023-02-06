# FROM jenkins/jenkins:lts
# USER root
# RUN apt-get update -qq
# RUN apt-get install -qq apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
# RUN apt-get update
# RUN apt-get install docker-ce -y
# RUN usermod -aG docker jenkins

FROM ubuntu
# USER root
# RUN mkdir -p jenkins_home
# RUN chmod 777 jenkins_home
# RUN apt-get update -qq
# RUN apt-get install openjdk-8-jdk -qq
# RUN apt-get install openssh-server -qq
# RUN useradd -ms /bin/bash jenkins
# # Docker Client
# RUN apt-get update -qq
# RUN apt-get install -qq apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# RUN apt-get update
# RUN apt-get install docker-ce -y
# RUN usermod -aG docker jenkins
RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN pip3 install Django==3.0.5
COPY . /app
WORKDIR /app
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
# USER jenkins
CMD [ "/bin/bash" ]
