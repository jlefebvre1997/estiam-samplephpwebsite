FROM composer:1.7.2
FROM jenkins/jenkins:lts

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER root

RUN curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose

RUN apt-get update -y && \
	apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update -y && \
	apt-get install -y docker-ce docker-ce-cli containerd.io

RUN gpasswd -a jenkins docker

USER jenkins

EXPOSE 8080
