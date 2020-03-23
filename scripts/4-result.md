sh: 1: !!: not found
$1 is train
In train start.sh
Current host is "algo-1-d85kk"
Compiling changehostname.c
Done Compiling changehostname.c
21:C 23 Mar 2020 03:16:30.222 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
21:C 23 Mar 2020 03:16:30.222 # Redis version=5.0.5, bits=64, commit=00000000, modified=0, pid=21, just started
21:C 23 Mar 2020 03:16:30.222 # Configuration loaded
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 5.0.5 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                   
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 21
  `-._    `-._  `-./  _.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |           http://redis.io        
  `-._    `-._`-.__.-'_.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |                                  
  `-._    `-._`-.__.-'_.-'    _.-'                                   
      `-._    `-.__.-'    _.-'                                       
          `-._        _.-'                                           
              `-.__.-'                                               

21:M 23 Mar 2020 03:16:30.224 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
21:M 23 Mar 2020 03:16:30.224 # Server initialized
21:M 23 Mar 2020 03:16:30.224 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
21:M 23 Mar 2020 03:16:30.224 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
21:M 23 Mar 2020 03:16:30.224 * Ready to accept connections
23/03/2020 03:16:30 passing arg to libvncserver: -rfbport
23/03/2020 03:16:30 passing arg to libvncserver: 5800
23/03/2020 03:16:30 x11vnc version: 0.9.13 lastmod: 2011-08-10  pid: 22
23/03/2020 03:16:30 
23/03/2020 03:16:30 wait_for_client: WAIT:0
23/03/2020 03:16:30 
23/03/2020 03:16:30 initialize_screen: fb_depth/fb_bpp/fb_Bpl 24/32/2560
23/03/2020 03:16:30 
23/03/2020 03:16:30 Listening for VNC connections on TCP port 5800
23/03/2020 03:16:30 Listening for VNC connections on TCP6 port 5900
23/03/2020 03:16:30 Listening also on IPv6 port 5800 (socket 6)
23/03/2020 03:16:30 

The VNC desktop is:      0934d9245734:5800
23/03/2020 03:16:30 possible alias:    0934d9245734::5800
PORT=5800
2020-03-23 03:16:31,782 sagemaker-containers INFO     Imported framework sagemaker_tensorflow_container.training
2020-03-23 03:16:31,899 sagemaker-containers INFO     Invoking user script

Training Env:

{
    "additional_framework_parameters": {
        "sagemaker_estimator": "RLEstimator"
    },
    "channel_input_dirs": {},
    "current_host": "algo-1-d85kk",
    "framework_module": "sagemaker_tensorflow_container.training:main",
    "hosts": [
        "algo-1-d85kk"
    ],
    "hyperparameters": {
        "s3_bucket": "bucket",
        "s3_prefix": "rl-deepracer-sagemaker",
        "aws_region": "us-east-1",
        "model_metadata_s3_key": "s3://bucket/custom_files/model_metadata.json",
        "RLCOACH_PRESET": "deepracer",
        "batch_size": 64,
        "num_epochs": 10,
        "stack_size": 1,
        "lr": 0.00035,
        "exploration_type": "categorical",
        "e_greedy_value": 0.05,
        "epsilon_steps": 10000,
        "beta_entropy": 0.01,
        "discount_factor": 0.999,
        "loss_type": "mean squared error",
        "num_episodes_between_training": 20,
        "term_cond_max_episodes": 100000,
        "term_cond_avg_score": 100000
    },
    "input_config_dir": "/opt/ml/input/config",
    "input_data_config": {},
    "input_dir": "/opt/ml/input",
    "is_master": true,
    "job_name": "rl-deepracer-sagemaker",
    "log_level": 20,
    "master_hostname": "algo-1-d85kk",
    "model_dir": "/opt/ml/model",
    "module_dir": "s3://bucket/rl-deepracer-sagemaker/source/sourcedir.tar.gz",
    "module_name": "training_worker",
    "network_interface_name": "eth0",
    "num_cpus": 4,
    "num_gpus": 1,
    "output_data_dir": "/opt/ml/output/data",
    "output_dir": "/opt/ml/output",
    "output_intermediate_dir": "/opt/ml/output/intermediate",
    "resource_config": {
        "current_host": "algo-1-d85kk",
        "hosts": [
            "algo-1-d85kk"
        ]
    },
    "user_entry_point": "training_worker.py"
}

Environment variables:

SM_HOSTS=["algo-1-d85kk"]
SM_NETWORK_INTERFACE_NAME=eth0
SM_HPS={"RLCOACH_PRESET":"deepracer","aws_region":"us-east-1","batch_size":64,"beta_entropy":0.01,"discount_factor":0.999,"e_greedy_value":0.05,"epsilon_steps":10000,"exploration_type":"categorical","loss_type":"mean squared error","lr":0.00035,"model_metadata_s3_key":"s3://bucket/custom_files/model_metadata.json","num_episodes_between_training":20,"num_epochs":10,"s3_bucket":"bucket","s3_prefix":"rl-deepracer-sagemaker","stack_size":1,"term_cond_avg_score":100000,"term_cond_max_episodes":100000}
SM_USER_ENTRY_POINT=training_worker.py
SM_FRAMEWORK_PARAMS={"sagemaker_estimator":"RLEstimator"}
SM_RESOURCE_CONFIG={"current_host":"algo-1-d85kk","hosts":["algo-1-d85kk"]}
SM_INPUT_DATA_CONFIG={}
SM_OUTPUT_DATA_DIR=/opt/ml/output/data
SM_CHANNELS=[]
SM_CURRENT_HOST=algo-1-d85kk
SM_MODULE_NAME=training_worker
SM_LOG_LEVEL=20
SM_FRAMEWORK_MODULE=sagemaker_tensorflow_container.training:main
SM_INPUT_DIR=/opt/ml/input
SM_INPUT_CONFIG_DIR=/opt/ml/input/config
SM_OUTPUT_DIR=/opt/ml/output
SM_NUM_CPUS=4
SM_NUM_GPUS=1
SM_MODEL_DIR=/opt/ml/model
SM_MODULE_DIR=s3://bucket/rl-deepracer-sagemaker/source/sourcedir.tar.gz
SM_TRAINING_ENV={"additional_framework_parameters":{"sagemaker_estimator":"RLEstimator"},"channel_input_dirs":{},"current_host":"algo-1-d85kk","framework_module":"sagemaker_tensorflow_container.training:main","hosts":["algo-1-d85kk"],"hyperparameters":{"RLCOACH_PRESET":"deepracer","aws_region":"us-east-1","batch_size":64,"beta_entropy":0.01,"discount_factor":0.999,"e_greedy_value":0.05,"epsilon_steps":10000,"exploration_type":"categorical","loss_type":"mean squared error","lr":0.00035,"model_metadata_s3_key":"s3://bucket/custom_files/model_metadata.json","num_episodes_between_training":20,"num_epochs":10,"s3_bucket":"bucket","s3_prefix":"rl-deepracer-sagemaker","stack_size":1,"term_cond_avg_score":100000,"term_cond_max_episodes":100000},"input_config_dir":"/opt/ml/input/config","input_data_config":{},"input_dir":"/opt/ml/input","is_master":true,"job_name":"rl-deepracer-sagemaker","log_level":20,"master_hostname":"algo-1-d85kk","model_dir":"/opt/ml/model","module_dir":"s3://bucket/rl-deepracer-sagemaker/source/sourcedir.tar.gz","module_name":"training_worker","network_interface_name":"eth0","num_cpus":4,"num_gpus":1,"output_data_dir":"/opt/ml/output/data","output_dir":"/opt/ml/output","output_intermediate_dir":"/opt/ml/output/intermediate","resource_config":{"current_host":"algo-1-d85kk","hosts":["algo-1-d85kk"]},"user_entry_point":"training_worker.py"}
SM_USER_ARGS=["--RLCOACH_PRESET","deepracer","--aws_region","us-east-1","--batch_size","64","--beta_entropy","0.01","--discount_factor","0.999","--e_greedy_value","0.05","--epsilon_steps","10000","--exploration_type","categorical","--loss_type","mean squared error","--lr","0.00035","--model_metadata_s3_key","s3://bucket/custom_files/model_metadata.json","--num_episodes_between_training","20","--num_epochs","10","--s3_bucket","bucket","--s3_prefix","rl-deepracer-sagemaker","--stack_size","1","--term_cond_avg_score","100000","--term_cond_max_episodes","100000"]
SM_OUTPUT_INTERMEDIATE_DIR=/opt/ml/output/intermediate
SM_HP_S3_BUCKET=bucket
SM_HP_S3_PREFIX=rl-deepracer-sagemaker
SM_HP_AWS_REGION=us-east-1
SM_HP_MODEL_METADATA_S3_KEY=s3://bucket/custom_files/model_metadata.json
SM_HP_RLCOACH_PRESET=deepracer
SM_HP_BATCH_SIZE=64
SM_HP_NUM_EPOCHS=10
SM_HP_STACK_SIZE=1
SM_HP_LR=0.00035
SM_HP_EXPLORATION_TYPE=categorical
SM_HP_E_GREEDY_VALUE=0.05
SM_HP_EPSILON_STEPS=10000
SM_HP_BETA_ENTROPY=0.01
SM_HP_DISCOUNT_FACTOR=0.999
SM_HP_LOSS_TYPE=mean squared error
SM_HP_NUM_EPISODES_BETWEEN_TRAINING=20
SM_HP_TERM_COND_MAX_EPISODES=100000
SM_HP_TERM_COND_AVG_SCORE=100000

Invoking script with the following command:

/usr/bin/python3.6 training_worker.py --RLCOACH_PRESET deepracer --aws_region us-east-1 --batch_size 64 --beta_entropy 0.01 --discount_factor 0.999 --e_greedy_value 0.05 --epsilon_steps 10000 --exploration_type categorical --loss_type mean squared error --lr 0.00035 --model_metadata_s3_key s3://bucket/custom_files/model_metadata.json --num_episodes_between_training 20 --num_epochs 10 --s3_bucket bucket --s3_prefix rl-deepracer-sagemaker --stack_size 1 --term_cond_avg_score 100000 --term_cond_max_episodes 100000


Initializing SageS3Client...
Successfully downloaded model metadata from custom_files/model_metadata.json.
Using the following hyper-parameters
{
  "batch_size": 64,
  "beta_entropy": 0.01,
  "discount_factor": 0.999,
  "e_greedy_value": 0.05,
  "epsilon_steps": 10000,
  "exploration_type": "categorical",
  "loss_type": "mean squared error",
  "lr": 0.00035,
  "num_episodes_between_training": 20,
  "num_epochs": 10,
  "stack_size": 1,
  "term_cond_avg_score": 100000.0,
  "term_cond_max_episodes": 100000
}
Uploaded hyperparameters.json to S3
Uploaded IP address information to S3: 172.18.0.5
## Creating graph - name: BasicRLGraphManager
Loaded action space from file: [{'steering_angle': -30, 'speed': 0.4, 'index': 0}, {'steering_angle': -30, 'speed': 0.8, 'index': 1}, {'steering_angle': -15, 'speed': 0.4, 'index': 2}, {'steering_angle': -15, 'speed': 0.8, 'index': 3}, {'steering_angle': 0, 'speed': 0.4, 'index': 4}, {'steering_angle': 0, 'speed': 0.8, 'index': 5}, {'steering_angle': 15, 'speed': 0.4, 'index': 6}, {'steering_angle': 15, 'speed': 0.8, 'index': 7}, {'steering_angle': 30, 'speed': 0.4, 'index': 8}, {'steering_angle': 30, 'speed': 0.8, 'index': 9}]
## Creating agent - name: agent
Checkpoint> Saving in path=['./checkpoint/0_Step-0.ckpt']
Uploaded 3 files for checkpoint 0
INFO:tensorflow:Froze 11 variables.
INFO:tensorflow:Converted 11 variables to const ops.
saved intermediate frozen graph: rl-deepracer-sagemaker/model/model_0.pb
Training> Name=main_level/agent, Worker=0, Episode=1, Total reward=25.15, Steps=97, Training iteration=0
Training> Name=main_level/agent, Worker=0, Episode=2, Total reward=78.02, Steps=279, Training iteration=0
Training> Name=main_level/agent, Worker=0, Episode=3, Total reward=70.08, Steps=450, Training iteration=0

