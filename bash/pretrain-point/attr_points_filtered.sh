SCRIPT_NAME=$(basename "$0")
PRETRAINING_TASKNAME=$(echo "$SCRIPT_NAME" | cut -d'.' -f1)

MODEL_NAME="gearnet_edge-mini"
CONFIG_FILE_NAME=$PRETRAINING_TASKNAME"_"$MODEL_NAME
echo $CONFIG_FILE_NAME

cd ../../

python script/pretrain.py \
  -c config/pretrain-point/$CONFIG_FILE_NAME.yaml \
  --gpus [$1]