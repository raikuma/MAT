import os
import glob
import shutil
import imageio.v2 as imageio

RGBROOT = "/home/ciplab/data/unseen/kubric360_v2"
MASKROOT= "/home/ciplab/Pytorch-UNet/results"

for scene in range(101, 110+1):
    for path in  glob.glob(os.path.join(RGBROOT, str(scene), "*rgb_test.png")):
        idx = os.path.basename(path).split("_")[0]
        shutil.copy(path, f"./test_sets/Kubric/images/{scene}_{idx}.png")

    for path in glob.glob(os.path.join(MASKROOT, str(scene), "*mask_pred.png")):
        img = 255 - imageio.imread(path)
        idx = os.path.basename(path).split("_")[0]
        imageio.imwrite(f"./test_sets/Kubric/masks/{scene}_{idx}.png", img)

    for path in glob.glob(os.path.join(RGBROOT, str(scene), "*inv_mask.png")):
        idx = os.path.basename(path).split("_")[0]
        shutil.copy(path, f"./test_sets/Kubric/errors/{scene}_{idx}.png")


