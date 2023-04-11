RGBROOT="/home/ciplab/data/unseen/kubric360_v2"
MASKROOT="/home/ciplab/Pytorch-UNet/results"

# echo "scene,view,none,inpaint_pred,inpaint_err,none_mask,inpaint_pred_mask,inpaint_err_mask"
for scene in {101..110}
do
    for i in {0..13}
    do
        echo "$scene,$i,`python /home/ciplab/metric/dice.py $RGBROOT/$scene/${i}_mask.png $MASKROOT/$scene/${i}_mask_pred.png`"
    done
done