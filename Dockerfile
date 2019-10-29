FROM tensorflow/tensorflow:1.8.0-gpu-py3

WORKDIR "/"

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONIOENCODING=utf-8

# install packages
RUN apt-get install -y python3-pip

# for ffmpeg
RUN add-apt-repository ppa:jonathonf/ffmpeg-3
RUN apt update -y
RUN apt install -y ffmpeg libav-tools x264 x265

RUN pip3 install --upgrade pip

# pip
RUN pip3 install ffmpeg-python

RUN cd /
RUN curl -L -O https://github.com/one-color-low/py-on-tf-docker-minimum-test/archive/master.zip
RUN unzip master.zip && rm master.zip
RUN echo y | apt-get install vim


CMD ["bash"]

