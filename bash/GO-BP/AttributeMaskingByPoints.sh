MODEL_NAME="gearnet_edge_1gpu"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IFS='/' read -ra dir_components <<< "$script_dir"
DOWNSTREAM_TASKNAME="${dir_components[-1]}"

SCRIPT_NAME=$(basename "$0")
PRETRAINING_TASKNAME=$(echo "$SCRIPT_NAME" | cut -d'.' -f1)

CHECKPOINT_PATH="/home/shpark/scratch/protein_outputs"
CHECKPOINT_PATH2="AlphaFoldDB/GearNet"

PATH_TO_FOLDER=$CHECKPOINT_PATH/$PRETRAINING_TASKNAME/$CHECKPOINT_PATH2/
RECENT_CHECKPOINT=$(find $PATH_TO_FOLDER -type f -name 'model_epoch_50.pth' -exec stat --format='%Y %n' {} + | sort -n | tail -n 1 | awk '{print $2}')
echo $RECENT_CHECKPOINT


GPU=[$1]

cd ../../

python script/downstream.py \
  -c config/downstream/$DOWNSTREAM_TASKNAME/$MODEL_NAME.yaml \
  --ckpt $RECENT_CHECKPOINT \
  --gpus $GPU \

