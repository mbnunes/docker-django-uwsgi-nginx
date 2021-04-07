FROM python:2.7-stretch
MAINTAINER Mauricio Nunes <mnunes@embeddednetworks.com.br>

RUN (apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git python python-dev python-setuptools nginx sqlite3)
RUN (easy_install pip &&\
  pip install uwsgi)

RUN pip install django==1.4.22

ADD app/requirements.txt /opt/django/app/requirements.txt
RUN pip install -r /opt/django/app/requirements.txt

EXPOSE 80
ENTRYPOINT ["nginx"]
