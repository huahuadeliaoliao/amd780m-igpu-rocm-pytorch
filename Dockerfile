# If you are not in China, you can use dockerhub images: rocm/pytorch:rocm5.7_ubuntu22.04_py3.10_pytorch_2.0.1
FROM registry.cn-hangzhou.aliyuncs.com/huahuadeliaoliao/amd780m-rocm5.7:latest

# If you are use AMD 680m igpu, set 10.0.0
ENV HSA_OVERRIDE_GFX_VERSION=11.0.0

RUN (getent group video || groupadd -r video) && \
    (getent group render || groupadd -r render) && \
    usermod -a -G video,render root

WORKDIR /home

RUN pip install -U pip

RUN pip install -U numba ultralytics