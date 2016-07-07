this_batch = 1
this_run = 1
train_data_dir = 'train_1000'
test_data_dir = 'test_100'


# vgg
rule train:
    shell: 'python train_inception_bn.py --train-dataset sf{this_run}_train.rec --val-dataset sf{this_run}_val.rec --model-prefix ./model/ckpt-shuffle{this_run} --gpus 0;
    #save the mean image
    cp mean.bin mean-rand-shuffle{this_run}.bin;'
rule prep:
    shell: "python make_list.py --recursive 1 {train_data_dir} sf{this_run} --train_ratio 0.9;
    im2rec_path=/udir/liuh/github/mxnet/bin/im2rec;
    $im2rec_path sf{this_run}_train.lst {train_data_dir}/ sf{this_run}_train.rec resize=360 color=1 encoding='.jpg';"
# rule download:
#     shell: 'cd inception; sh inception/download.sh'
