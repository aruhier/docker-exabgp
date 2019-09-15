FROM python:3-alpine
MAINTAINER Anthony Ruhier <https://github.com/aruhier>

RUN pip install --upgrade pip setuptools
RUN mkdir -p /usr/etc/exabgp \
    && pip install exabgp

ADD entrypoint.sh /
ADD exabgp.conf.example /usr/etc/exabgp/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["exabgp"]
VOLUME ["/usr/etc/exabgp"]
EXPOSE 179
