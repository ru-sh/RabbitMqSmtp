FROM dockerfile/rabbitmq

ADD gen_smtp-0.9.0.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.0/plugins/
ADD rabbitmq_email-0.1.0.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.0/plugins/

CMD rabbitmq-plugins enable gen_smtp

EXPOSE 2525