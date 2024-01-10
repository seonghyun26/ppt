MODEL_NAME="gearnet_edge"
DOWNSTREAM_TASKNAME="GO-BP"
CHECKPOINT_PATH="/home/shpark/prj-protein-rep/GearNet/config/checkpoint"
CHECKPOINT_NAME="attr_gearnet_edge"
GPU=[6]

cd ../

python script/downstream.py \
  -c config/downstream/$DOWNSTREAM_TASKNAME/$MODEL_NAME.yaml \
  --ckpt $CHECKPOINT_PATH/$CHECKPOINT_NAME.pth \
  --gpus $GPU \

