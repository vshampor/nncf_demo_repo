FROM nvidia/cuda:10.2-devel
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt -y update
RUN apt install -y build-essential python3 python3-pip python3-dev git git-lfs libgl1-mesa-glx
RUN pip3 -q install pip --upgrade
ENV http_proxy=$http_proxy
ENV https_proxy=$https_proxy
RUN pip3 install jupyter
RUN mkdir demo_repo

WORKDIR demo_repo
COPY . .
RUN git lfs install

RUN pip3 install -r requirements.txt

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
