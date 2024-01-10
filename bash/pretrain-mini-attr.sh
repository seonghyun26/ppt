# angle, dihedral, dis, lp, mc, plddt
PRETRAINING_TASKNAME="attr"
MODEL_NAME="gearnet_edge-mini"
CONFIG_FILE_NAME=$PRETRAINING_TASKNAME"_"$MODEL_NAME

cd ../

echo $CONFIG_FILE_NAME

python script/pretrain.py \
  -c config/pretrain/$CONFIG_FILE_NAME.yaml \
  --gpus [0]