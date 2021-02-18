# How to download datasets?

You are now at `/path/to/arterarejo/corpora`

## valid/test inputs for BEA-19 shared task
```
sh bea19/eval/download.sh 
```

## FCE dataset
```
sh bea19/train/fce/download.sh 
```

## Lang8 dataset
Please access [the website of BEA19 shared task](https://www.cl.cam.ac.uk/research/nl/bea2019st/#data).
Then, please request and get Lang-8 dataset.

Please place `lang8.bea19.tar.gz` under `bea19/train/lang8/` and run `tar zxvf lang8.bea19.tar.gz` there.

## NUCLE dataset
Please access [the website of BEA19 shared task](https://www.cl.cam.ac.uk/research/nl/bea2019st/#data).
Then, please request and get NUCLE dataset.

Please place `release3.3.tar.bz2` under `bea19/train/nucle/` and run `tar jxvf release3.3.tar.bz2` there.

## W&I+LOCNESS dataset
```
sh bea19/train/wi+locness/download.sh
```

## CoNLL13 dataset
```
sh conll/conll13/download.sh
```

## CoNLL14 dataset
```
sh conll/conll14/download.sh
```

## JFLEG dataset
```
sh jfleg/download.sh
```

## WMT monolingual data
```
sh wmt/download.sh
```

# Preprocessing for lang-8 dataset
```
sh preprocessed/run.sh
```

