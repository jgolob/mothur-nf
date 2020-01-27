FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER Jonathan Golob <j-dev@golob.org>
LABEL    software="mothur" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mothur" \ 
    about.summary="Mothur" \ 
    about.home="http://www.mothur.org/" \ 
    software.version="1.43.0" \ 
    upstream.version="" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL" \ 
    about.license_file="" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
USER root
RUN apt-get update && apt-get install -y wget unzip \ 
&& mkdir -p /src/ \
&& cd /src/ \
&& wget https://github.com/mothur/mothur/releases/download/v.1.43.0/Mothur.linux_noReadline.zip \
&& unzip Mothur.linux_noReadline.zip \
&& cp /src/mothur/mothur /usr/local/bin/ && cp /src/mothur/vsearch /usr/local/bin/ && cp /src/mothur/uchime /usr/local/bin/ \
&& cp /src/mothur/blast/bin/* /usr/local/bin/ \
&& cd / && rm -r /src/ \
&& apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
