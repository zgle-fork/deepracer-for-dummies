#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

## Patch system
sudo apt-get update && sudo apt-mark hold grub-pc && sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o \
                        DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" -qq --force-yes upgrade && \
                        sudo apt-get -y install jq

source $DIR/detect.sh
echo "Detected cloud type ${CLOUD_NAME}"

## Do I have a GPU
GPUS=$(lspci | awk '/NVIDIA/ && /3D controller/' | wc -l)
if [ $? -ne 0 ] || [ $GPUS -eq 0 ];
then
        echo "No NVIDIA GPU detected. Exiting".
        exit 1
fi

## Adding Nvidia Drivers
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda_learn.list'
sudo bash -c 'apt update && apt install -y nvidia-driver-440 cuda-minimal-build-10-2 -o Dpkg::Options::="--force-overwrite"'

# ## Adding AWSCli: (done in ec2 already)
# sudo apt-get install -y awscli 

## Installing Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-docker2 nvidia-container-toolkit nvidia-container-runtime
jq 'del(."default-runtime") + {"default-runtime": "nvidia"}' /etc/docker/daemon.json | sudo tee /etc/docker/daemon.json
sudo systemctl enable docker
sudo systemctl restart docker

## Ensure user can run docker
sudo usermod -a -G docker $(id -un)

## Installing Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# ## Reboot to load driver -- continue install if in cloud-init
CLOUD_INIT=$(pstree -s $BASHPID | awk /cloud-init/ | wc -l)
echo "CLOUD_INIT: $CLOUD_INIT"
if [[ "$CLOUD_INIT" -ne 0 ]];
then
      echo 'todo'
#     echo "Rebooting in 5 seconds. Will continue with install."
#     cd $DIR
#     ./runonce.sh "./init.sh -m /mnt -c ${CLOUD_NAME}"
#     sleep 5s
#     sudo reboot
else
    echo "First stage done. Please reboot and run init.sh"
fi

# VNC
echo "wget https://www.realvnc.com/download/file/viewer.files/VNC-Server-6.7.1-Linux-x64.deb"
echo "sudo dpkg -i VNC-Server-6.7.1-Linux-x64.deb"