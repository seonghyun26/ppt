SCRIPT_NAME=$(basename "$0")
PRETRAINING_TASKNAME=$(echo "$SCRIPT_NAME" | cut -d'.' -f1)

MODEL_NAME="gearnet_edge-mini"
CONFIG_FILE_NAME=$PRETRAINING_TASKNAME"_"$MODEL_NAME

cd ../../

echo $CONFIG_FILE_NAME

python script/pretrain.py \
  -c config/pretrain/$CONFIG_FILE_NAME.yaml \
  --gpus [$1]