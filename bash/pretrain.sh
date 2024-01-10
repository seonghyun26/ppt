# angle, dihedral, dis, lp, mc, ppt
PRETRAINING_TASKNAME="attr"
MODEL_NAME="gearnet_edge"
CONFIG_FILE_NAME=$PRETRAINING_TASKNAME"_"$MODEL_NAME

cd ../

python script/pretrain.py \
  -c config/pretrain/$CONFIG_FILE_NAME.yaml \
  --gpus [7]