FROM jenkins:2.32.3

ENV DOCKER_DEB_FILE_NAME "docker-engine_17.03.0~ce-0~debian-jessie_amd64.deb"

USER root
RUN apt-get update && \
  apt-get install -y iptables init-system-helpers libapparmor1 && \
  wget https://apt.dockerproject.org/repo/pool/main/d/docker-engine/$DOCKER_DEB_FILE_NAME && \
  dpkg -i $DOCKER_DEB_FILE_NAME && \
  apt-get install -f && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf $DOCKER_DEB_FILE_NAME