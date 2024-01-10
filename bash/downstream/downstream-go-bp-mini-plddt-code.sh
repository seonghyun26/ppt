MODEL_NAME="gearnet_edge"
DOWNSTREAM_TASKNAME="GO-BP"

CHECKPOINT_PATH="/home/shpark/scratch/protein_outputs"
CHECKPOINT_TYPE="PlddtPredictionWithProteinCode"
CHECKPOINT_PATH2="AlphaFoldDB/GearNet"

PATH_TO_FOLDER=$CHECKPOINT_PATH/$CHECKPOINT_TYPE/$CHECKPOINT_PATH2/
RECENT_CHECKPOINT=$(find $PATH_TO_FOLDER -type f -name 'model_epoch_50.pth' -exec stat --format='%Y %n' {} + | sort -n | tail -n 1 | awk '{print $2}')
echo $RECENT_CHECKPOINT

GPU=[$1]

cd ../../

python script/downstream.py \
  -c config/downstream/$DOWNSTREAM_TASKNAME/$MODEL_NAME.yaml \
  --ckpt $RECENT_CHECKPOINT \
  --gpus $GPU \

