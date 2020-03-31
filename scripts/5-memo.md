Unpacking nvidia-docker2 (2.2.2-1) ...
Setting up libnvidia-container1:amd64 (1.0.7-1) ...
Setting up libnvidia-container-tools (1.0.7-1) ...
Setting up nvidia-container-toolkit (1.0.5-1) ...
Setting up nvidia-container-runtime (3.1.4-1) ...
Setting up nvidia-docker2 (2.2.2-1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Synchronizing state of docker.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable docker

sudo systemctl restart docker
Job for docker.service failed because the control process exited with error code.
See "systemctl status docker.service" and "journalctl -xe" for details.


  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   617  100   617    0     0  21275      0 --:--:-- --:--:-- --:--:-- 21275
100 16.2M  100 16.2M    0     0  51.3M      0 --:--:-- --:--:-- --:--:-- 51.3M
CLOUD_INIT: 0


First stage done. Please reboot and run init.sh
Open your Ubuntu browser to download VNC package: https://www.realvnc.com/en/connect/download/viewer/
then, e.g., sudo dpkg -i VNC-Server-6.7.1-Linux-x64.deb




--------------------------------
Status: Downloaded newer image for aschu/log-analysis:latest
docker: Error response from daemon: error while creating mount source path '/home/ubuntu/1-code/2-deepracer-for-dummies-zgle-fork/docker/volumes/.aws': mkdir /home/ubuntu/1-code/2-deepracer-for-dummies-zgle-fork/docker/volumes/.aws: file exists.

mkdir -p /home/ubuntu/.aws; log-analysis/.start.sh;

# Training
## tracks
ubuntu@ip-10-212-202-122:~/1-code/2-deepracer-for-dummies-zgle$ ls ./deepracer/simulation/aws-robomaker-sample-application-deepracer/simulation_ws/src/deepracer_simulation/models/
AWS_track                  hard_speed_track
Bowtie_track               hard_track
Canada_Training            medium_track
China_track                reInvent2019_track
Mexico_track               reInvent2019_wide
New_York_Track             reInvent2019_wide_mirrored
Oval_track                 reinvent_base
Straight_track             reinvent_carpet
Tokyo_Training_track       reinvent_carpet_carpet
Vegas_track                reinvent_concrete
Virtual_May19_Train_track  reinvent_concrete_concrete
box_obstacle               reinvent_grass_asphalt
camera                     reinvent_lines_walls
easy_track                 reinvent_wood
hard_loopy_track           reinvent_wood_wood

## reward function
docker/volumes/minio/bucket/custom_files/reward.py

## Action space 
docker/volumes/minio/bucket/custom_files/model_metadata.json

## Training output
ubuntu@ip-10-212-202-122: $ ls docker/volumes/minio/bucket/rl-deepracer-sagemaker/model
0_Step-0.ckpt.data-00000-of-00001     1_Step-5100.ckpt.index
0_Step-0.ckpt.index                   1_Step-5100.ckpt.meta
0_Step-0.ckpt.meta                    checkpoint
1_Step-3617.ckpt.data-00000-of-00001  model_0.pb
1_Step-3617.ckpt.index                model_1.pb
1_Step-3617.ckpt.meta                 model_metadata.json
1_Step-5100.ckpt.data-00000-of-00001

## snapshot files (overnight run: >150GB)
docker/volumes/robo/checkpoint

## stop training
./stop.sh

## continue training
- ./stop.sh
- modify rl_deepracer_coach_robomaker.py to continue from a pretrained model in the local minio folder.
  - uncomment out the last 3 lines in the hyperparameters:
    "pretrained_s3_bucket": "{}".format(s3_bucket),
    "pretrained_s3_prefix": "rl-deepracer-pretrained"
  - ./set-last-run-to-pretrained.sh
  - sudo ./delete-last-run.sh
  - ./start.sh

## upload model online to a virtual race
- AWS DR Console: 
  - create a model, (the parameters don't matter a lot)
  - submit to virtual race
  - Go to "Simulation" > "Simulation applcation":
    - MODEL_S3_BUCKET
    - MODEL_S3_PREFIX
    - Use the above values to update the script: upload-snapshot.sh
    - ./upload-snapshot.sh ( -c {checkpoint_id} )

# Evaluation
Use the last training run to evaluate. Usually, the log-analysis is good enough to do the evalation job.

# Log Analysis
## notebook
No need to run ./stop.sh unless you need to.

### data/Training_analysis.ipynb
- set track: 
- set logfile: 
  - fname='../logs/x.log', where x is the latest log file name
