FROM debian:latest

RUN apt-get update && \
    apt-get install -y openssh-server nginx && \
    mkdir -p /run/sshd

COPY setup-ssh.sh /setup-ssh.sh
RUN chmod +x /setup-ssh.sh

COPY nginx.conf /etc/nginx/sites-enabled/default

EXPOSE 22 8080

CMD bash -c "/setup-ssh.sh && service ssh start && service nginx start && tail -f /dev/null"