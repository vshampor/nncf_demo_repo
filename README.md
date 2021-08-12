This repository stores a simple semantic segmentation Pytorch training pipeline for UNet on CamVid with pre-trained weights and a Jupyter notebook that demonstrates the process of integrating the NNCF (https://github.com/openvinotoolkit/nncf) into the existing training code with purpose of obtaining a quantized model using quantization-aware training, as an alternative to the post-training quantization. For your convenience, a Dockerfile is present to provide a controlled environment.

## Usage
### Prerequisites
To run this demo, a machine with at least one NVIDIA GPU on board is required.
### Run Jupyter notebook directly
1. Install the requirements of the training pipeline into your Python 3.7+ environment by running:
```
pip install -r requirements.txt
```
Use your Jupyter installation to run the [notebook](./unet_camvid_int8_nncf_quantization.ipynb) in the repository, such as via launching the Jupyter server using CLI and following the spawned URL using the web browser:
```
jupyter notebook --no-browser --port=8889 --ip=0.0.0.0
```

The system prerequisites of both OpenVINO (https://github.com/openvinotoolkit/openvino) and NNCF (https://github.com/openvinotoolkit/nncf) must be installed.

### Run Jupyter notebook via Docker
1. Make sure that your system has Docker installed with GPU forwarding support (such as via installing the additional `nvidia-container-toolkit` via `apt` on Ubuntu)
2. Use the Dockerfile in the repository root to build the image that contains the repo files and the notebook; from the repository root, execute:
```
docker build -t nncf_demo . --build-arg=http_proxy=$http_proxy --build-arg=https_proxy=$https_proxy
```
3. Run the built image while enabling GPU access for the running container (adjust --shm-size value if necessary for your RAM size):
```
docker run -p 8888:8888 --gpus all --shm-size=8G nncf_demo
```
4. Connect to the Jupyter server as usual using the URL spawned on the command line and run the .ipynb notebook when presented with the Jupyter's file browser interface.

