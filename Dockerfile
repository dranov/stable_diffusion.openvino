FROM openvino/ubuntu20_runtime:2022.1.0

# Copy the model to the container
WORKDIR /home/openvino
RUN mkdir stable_diffusion
COPY data/ /home/openvino/stable_diffusion/data/
COPY requirements.txt /home/openvino/stable_diffusion/
COPY stable_diffusion.py /home/openvino/stable_diffusion/

WORKDIR /home/openvino/stable_diffusion
RUN pip3 install -r requirements.txt

# Make it download the models
RUN python3 stable_diffusion.py --prompt "Street-art painting of Emilia Clarke in style of Banksy, photorealism" --num-inference-steps 1
