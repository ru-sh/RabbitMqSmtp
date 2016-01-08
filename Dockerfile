FROM rabbitmq:3-management

ADD gen_smtp-0.9.0.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.0/plugins/
ADD rabbitmq_email-0.1.0.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.0/plugins/

ADD EmailPlugin.config /etc/rabbitmq/
RUN cat /etc/rabbitmq/rabbitmq.config /etc/rabbitmq/EmailPlugin.config
RUN mv /etc/rabbitmq/EmailPlugin.config /etc/rabbitmq/rabbitmq.config
RUN rabbitmq-plugins enable --offline gen_smtp

EXPOSE 2525