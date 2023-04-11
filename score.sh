GT_ROOT="/home/ciplab/data/unseen/kubric360_v2"
PRED_ROOT="./result"
PRED_ROOT2="./result2"

echo "scene,view,none,inpaint_pred,inpaint_err,none_mask,inpaint_pred_mask,inpaint_err_mask"
for scene in {101..110}
do
    for i in {0..13}
    do
        echo "$scene,$i,`python ~/metric/psnr.py $GT_ROOT/$scene/${i}_rgb_gt.png $GT_ROOT/${scene}/${i}_rgb_test.png`,`python ~/metric/psnr.py $GT_ROOT/$scene/${i}_rgb_gt.png $PRED_ROOT/${scene}_${i}.png`,`python ~/metric/psnr.py $GT_ROOT/$scene/${i}_rgb_gt.png $PRED_ROOT2/${scene}_${i}.png`,`python ~/metric/psnr.py $GT_ROOT/$scene/${i}_rgb_gt.png $GT_ROOT/${scene}/${i}_rgb_test.png $GT_ROOT/${scene}/${i}_seg.png`,`python ~/metric/psnr.py $GT_ROOT/$scene/${i}_rgb_gt.png $PRED_ROOT/${scene}_${i}.png $GT_ROOT/${scene}/${i}_seg.png`,`python ~/metric/psnr.py $GT_ROOT/$scene/${i}_rgb_gt.png $PRED_ROOT2/${scene}_${i}.png $GT_ROOT/${scene}/${i}_seg.png`"
    done
done