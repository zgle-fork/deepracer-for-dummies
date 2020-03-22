#!/usr/bin/env bash

# create directory structure for docker volumes
mkdir -p docker/volumes/minio/bucket/custom_files \
		 docker/volumes/robo/checkpoint

# create symlink to current user's home .aws directory 
# NOTE: AWS cli must be installed for this to work
# https://docs.aws.amazon.com/cli/latest/userguide/install-linux-al2017.html
ln_aws="docker/volumes/.aws"
if [[ ! -L $ln_aws ]] 
then
    echo "Creating ln: $ln_aws"
    ln -s $(eval echo "~${USER}")/.aws  $ln_aws
else
    echo "Good! ln_aws exists, so no need to re-create: $ln_aws"
fi

# grab local training deepracer repo from crr0004 and log analysis repo from vreadcentric
git clone --recurse-submodules https://github.com/crr0004/deepracer.git

git clone https://github.com/breadcentric/aws-deepracer-workshops.git && cd aws-deepracer-workshops && git checkout enhance-log-analysis && cd ..

# # setup symlink to log_analysis/
ln_log_analysis="docker/volumes/log-analysis"
if [[ ! -L $ln_log_analysis ]] 
then
    echo "Creating ln: $ln_log_analysis"
    ln -s ../../aws-deepracer-workshops/log-analysis $ln_log_analysis
else
    echo "Good! ln_log_analysis exists, so no need to re-create: $ln_log_analysis"
fi

# # setup symlink to rl-coach config file
ln_dr_py="rl_deepracer_coach_robomaker.py"
if [[ ! -f $ln_dr_py ]] 
then
    echo "Creating ln: $ln_dr_py"
    ln -s deepracer/rl_coach/rl_deepracer_coach_robomaker.py $ln_dr_py
else
    echo "Good! ln_dr_py exists, so no need to re-create: $ln_dr_py"
fi

# replace the contents of the rl_deepracer_coach_robomaker.py file with the gpu specific version (this is also where you can edit the hyperparameters)
# TODO this file should be genrated from a gui before running training
cat overrides/$ln_dr_py >$ln_dr_py

#set proxys if required
for arg in "$@";
do
    IFS='=' read -ra part <<< "$arg"
    if [ "${part[0]}" == "--http_proxy" ] || [ "${part[0]}" == "--https_proxy" ] || [ "${part[0]}" == "--no_proxy" ]; then
        var=${part[0]:2}=${part[1]}
        args="${args} --build-arg ${var}"
    fi
done

echo "args: ${args}"
# build rl-coach image with latest code from crr0004's repo in the Context (deepracer/)
docker_image="aschu/rl_coach"
if [[ "$(docker images -q aschu/rl_coach 2> /dev/null)" == "" ]] 
then
    docker build ${args} -f ./docker/dockerfiles/rl_coach/Dockerfile -t $docker_image deepracer/
else
    echo "Good! docker_image exists: $docker_image"
fi

# copy reward function and model-metadata files to bucket 
cp deepracer/custom_files/* docker/volumes/minio/bucket/custom_files/

# create the network sagemaker-local if it doesn't exit
SAGEMAKER_NW='sagemaker-local'
docker network ls | grep -q $SAGEMAKER_NW
if [ $? -ne 0 ]
then
	  docker network create $SAGEMAKER_NW
fi