# afiksilo

## What's afiksilo?

Please read [arteraro/afiksilo/README.md](https://github.com/nymwa/arteraro/blob/main/arteraro/afiksilo/README.md)

## preparation for afiksilo

`frequency.tsv` is already generated.
If you want to regenerate `frequency.tsv`, please follow the instruction below.

This preparation needs preparation process of `arterarejo/tokenized`. Please read and follow [tokenized/README.md](https://github.com/nymwa/arterarejo/tree/main/tokenized).

### run directly
```
sh all/prepare.sh
```

### run by qsub
```
qsub -g (your group) -l rt_C.small=1 -l h_rt=1:0:0 -v WORKDIR=/path/to/arterarejo/afiksilo/all,IS_SGE=yes all/prepare.sh
```

## make model for afiksilo

### run directly
```
sh all/make_model.sh
```

### run by qsub
```
qsub -g (your group) -l rt_C.small=1 -l h_rt=1:0:0 -v WORKDIR=/path/to/arterarejo/afiksilo/all,IS_SGE=yes all/make_model.sh
```

