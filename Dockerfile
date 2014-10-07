FROM ubuntu:latest
MAINTAINER Andrew Pietila <me@ajp.xyz>

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install ejabberd

RUN chown ejabberd:ejabberd -R /var/lib/ejabberd
RUN chmod 0700 -R /var/lib/ejabberd/

VOLUME ["/etc/ejabberd"]
VOLUME ["/var/lib/ejabberd"]

# Client port
EXPOSE 5222

# Server-to-server port
EXPOSE 5269

# http port
EXPOSE 5280

ENTRYPOINT ["run.sh"]
