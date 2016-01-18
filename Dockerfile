FROM rabbitmq:3-management

RUN apt-get -y update
RUN apt-get -y install openssh-server
RUN apt-get -y install git
RUN apt-get -y install build-essential python

RUN git clone https://github.com/gotthardp/rabbitmq-email.git
WORKDIR rabbitmq-email
RUN make dist

ADD EmailPlugin.config /etc/rabbitmq/
RUN mv /etc/rabbitmq/EmailPlugin.config /etc/rabbitmq/rabbitmq.config
RUN rabbitmq-plugins enable --offline rabbitmq_email

EXPOSE 2525
