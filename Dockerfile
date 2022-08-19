# DFIR Viper

FROM ubuntu:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/London

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && apt-get update \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt update \
    && apt install -y python3.9 python3.9-dev

RUN apt-get update && apt-get upgrade -y \
    && apt install -y git build-essential \
    python3-pip exiftool \
    clamav-daemon tor libdpkg-perl libssl-dev \
    swig libffi-dev ssdeep libfuzzy-dev unrar-free \
    p7zip-full apache2 libusb-1.0-0 libusb-1.0-0-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && pip3 install -r requirements.txt

EXPOSE 8080

COPY . .

RUN pip3 install git+https://github.com/sebdraven/verify-sigs.git

# Create Viper User
RUN groupadd -r viper && \
  useradd -r -g viper -d /home/viper -s /sbin/nologin -c "Viper User" viper && \
  mkdir /home/viper && \
  chown -R viper:viper /home/viper

USER viper
WORKDIR /home/viper

RUN git clone https://github.com/viper-framework/viper.git \
    && mkdir /home/viper/workdir

USER root
WORKDIR /home/viper/viper

RUN sed -i 's/==/>=/g' setup.py \
    && pip3 install . \
    && chmod a+xr viper    

USER viper
WORKDIR /home/viper

RUN git clone https://github.com/DanDreadless/viper-web.git

USER root
WORKDIR /home/viper/viper-web


RUN pip3 install MarkupSafe --upgrade \
    && pip3 install . \
    && pip3 install --force pymips[fileobjects] \
    && export PATH=$HOME/.local/bin:$PATH \
    #&& pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U \
    && sed -i 's/127.0.0.1/0.0.0.0/g' viper-web \
    && chmod a+xr viper-web

#Comment out the below once modules have updated
#CMD ["viper"]
#RUN echo "update-modules"
#Un-comment to run viper-web
USER viper
WORKDIR /home/viper/workdir
CMD ["../viper-web/viper-web"]
