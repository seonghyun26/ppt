MODEL_NAME="gearnet_edge_1gpu"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IFS='/' read -ra dir_components <<< "$script_dir"
DOWNSTREAM_TASKNAME="${dir_components[-1]}"

GPU=[$1]

cd ../../

python script/downstream.py \
  -c config/downstream/$DOWNSTREAM_TASKNAME/$MODEL_NAME.yaml \
  --gpus $GPU \