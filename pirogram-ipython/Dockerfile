FROM alpine:latest

RUN apk update && apk add shadow python3 \
    wget bzip2 ca-certificates build-base imagemagick git procps python3-dev \
    libxml2-dev libxslt-dev freetype-dev libpng-dev lapack-dev openblas \
    gfortran

RUN pip3 install --upgrade pip && \
    groupadd -r jupyter && useradd --no-log-init -r -m -d /home/jupyter -g jupyter jupyter && \
    mkdir /data && chown jupyter: /data

RUN pip3 install numpy && \
    pip3 install seaborn ggplot pandas matplotlib \
    numexpr bottleneck python-dateutil pytz lxml html5lib beautifulsoup4 jupyter

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN mkdir content
COPY jupyter-config.json /home/jupyter
COPY jupyter-launcher.sh /home/jupyter
RUN chown jupyter: /home/jupyter/*

USER jupyter
WORKDIR /home/jupyter

EXPOSE 59488/tcp
EXPOSE 59489/tcp
EXPOSE 59490/tcp
EXPOSE 59491/tcp
EXPOSE 59492/tcp

CMD ["/home/jupyter/jupyter-launcher.sh"]