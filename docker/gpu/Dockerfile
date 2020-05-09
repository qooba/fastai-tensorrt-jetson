FROM nvcr.io/nvidia/tensorrt:20.01-py3
WORKDIR /
RUN apt-get update && apt-get -yq install python3-pil
RUN pip3 install jupyterlab torch torchvision
RUN pip3 install fastai
RUN DEBIAN_FRONTEND=noninteractive && apt update && apt install curl git cmake ack g++ tmux -yq
RUN pip3 install ipywidgets && jupyter nbextension enable --py widgetsnbextension
CMD ["sh","-c", "jupyter lab --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --allow-root --NotebookApp.password='' --NotebookApp.token=''"]
