FROM alpine:latest
RUN apk add --no-cache openssh frotz bash
RUN ssh-keygen -A
RUN adduser -D -s /bin/bash zork
RUN echo 'zork:bluesword' | chpasswd
RUN wget -qO /zork1.z3 "https://eblong.com/infocom/gamefiles/zork1-r119-s880429.z3"
RUN echo "Match User zork" >> /etc/ssh/sshd_config
RUN echo "    ForceCommand frotz /zork1.z3" >> /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
