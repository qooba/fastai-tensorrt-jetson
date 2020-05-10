FROM nvcr.io/nvidia/l4t-base:r32.2.1
WORKDIR /
# install pytorch 
RUN apt update && apt install -y --fix-missing make g++ python3-pip libopenblas-base
RUN wget https://nvidia.box.com/shared/static/ncgzus5o23uck9i5oth2n8n06k340l6k.whl -O torch-1.4.0-cp36-cp36m-linux_aarch64.whl
RUN pip3 install Cython
RUN pip3 install numpy torch-1.4.0-cp36-cp36m-linux_aarch64.whl
# install torchvision
RUN apt update && apt install libjpeg-dev zlib1g-dev git libopenmpi-dev openmpi-bin -yq
RUN git clone --branch v0.5.0 https://github.com/pytorch/vision torchvision
RUN cd torchvision && python3 setup.py install
# install fastai
RUN pip3 install jupyterlab
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt update && apt -yq install npm nodejs python3-pil python3-opencv
RUN apt update && apt -yq install python3-matplotlib
RUN git clone https://github.com/NVIDIA-AI-IOT/torch2trt.git /torch2trt && mv /torch2trt/torch2trt /usr/local/lib/python3.6/dist-packages && rm -r /torch2trt
COPY tensorrt /usr/lib/python3.6/dist-packages/tensorrt
RUN pip3 install --no-deps fastai
RUN git clone https://github.com/fastai/fastai /fastai
RUN apt update && apt install libblas3 liblapack3 liblapack-dev libblas-dev gfortran -yq
RUN curl -LO https://github.com/explosion/cython-blis/files/3566013/blis-0.4.0-cp36-cp36m-linux_aarch64.whl.zip && unzip blis-0.4.0-cp36-cp36m-linux_aarch64.whl.zip && rm blis-0.4.0-cp36-cp36m-linux_aarch64.whl.zip
COPY blis-0.4.0-cp36-cp36m-linux_aarch64.whl .
RUN pip3 install scipy pandas blis-0.4.0-cp36-cp36m-linux_aarch64.whl spacy fastai scikit-learn
CMD ["sh","-c", "jupyter lab --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --allow-root --NotebookApp.password='' --NotebookApp.token=''"]
