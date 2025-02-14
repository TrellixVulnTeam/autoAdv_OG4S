# 1000 * 2040/32 = 63750
#CUDA_VISIBLE_DEVICES=0 python train_model.py \
#    --batch_size 32 \
#    --dataset_name "oxfordFlowers" \
#    --model_name "inception_v3" \
#    --train_dir "./ckpts/oxfordFlowers_adam" \
#    --use_adam True \
#    --max_number_of_steps 63750  1> ./log/oxfordFlowers_adam.log 2>&1

# 1000 * 6667/32 = 208343.75
#CUDA_VISIBLE_DEVICES=0 python train_model.py \
#    --batch_size 32 \
#    --dataset_name "stanfordCars" \
#    --model_name "inception_v3" \
#    --train_dir "./ckpts/stanfordCars_adam" \
#    --use_adam True \
#    --max_number_of_steps 208344  1> ./log/stanfordCars_adam.log 2>&1

# 1000 * 8144/32 = 254500
#CUDA_VISIBLE_DEVICES=0 python train_model.py \
#    --batch_size 32 \
#    --dataset_name "fgvcAircraft" \
#    --model_name "inception_v3" \
#    --train_dir "./ckpts/fgvcAircraft_adam" \
#    --use_adam True \
#    --max_number_of_steps 254500  1> ./log/fgvcAircraft_adam.log 2>&1



# 1000 * 2040/32 = 63750
CUDA_VISIBLE_DEVICES=8 python train_model.py \
    --batch_size 32 \
    --dataset_name "oxfordFlowers" \
    --model_name "inception_v4" \
    --train_dir "./ckpts/oxfordFlowers_imgnetpretrained_RMSProp2" \
    --use_adam False \
    --pretrianed_model /home/haojieyuan/autoAdv/benchmark/pretrained/normal/inception_v4.ckpt \
    --ignore_missing_vars True \
    --max_number_of_steps 63750


echo "Evaluating Inception v3 on Oxford Flowers."
CUDA_VISIBLE_DEVICES=0 python eval.py --model_name="inception_v3" \
  --checkpoint_path="/home/haojieyuan/autoAdv/benchmark/fine_grain_datsets/ckpts/oxfordFlowers_imgnetpretrained_RMSProp/" \
  --batch_size=50 \
  --dataset_name="oxfordFlowers" \
  --num_classes=102 \
  --split 'train'

echo "Evaluating Inception v3 on Oxford Flowers."
CUDA_VISIBLE_DEVICES=0 python eval.py --model_name="inception_v3" \
  --checkpoint_path="/home/haojieyuan/autoAdv/benchmark/fine_grain_datsets/ckpts/oxfordFlowers_imgnetpretrained_RMSProp/" \
  --batch_size=50 \
  --dataset_name="oxfordFlowers" \
  --num_classes=102 \
  --split 'test'


exit 0
# 1000 * 6667/32 = 208343.75
CUDA_VISIBLE_DEVICES=0 python train_model.py \
    --batch_size 32 \
    --dataset_name "stanfordCars" \
    --model_name "inception_v3" \
    --train_dir "./ckpts/stanfordCars_adam" \
    --use_adam True \
    --max_number_of_steps 208344  1> ./log/stanfordCars_adam.log 2>&1

# 1000 * 8144/32 = 254500
CUDA_VISIBLE_DEVICES=0 python train_model.py \
    --batch_size 32 \
    --dataset_name "fgvcAircraft" \
    --model_name "inception_v3" \
    --train_dir "./ckpts/fgvcAircraft_adam" \
    --use_adam True \
    --max_number_of_steps 254500  1> ./log/fgvcAircraft_adam.log 2>&1