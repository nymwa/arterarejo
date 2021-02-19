# How to prepare tokenized corpora?

## run directly
```
sh commentary/run.sh
sh crawl15/run.sh
sh crawl16/run.sh
sh crawl17/run.sh
sh crawl18/run.sh
sh crawl19/run.sh
sh europarl/run.sh
```

## run by qsub
```
qsub -g (your group) -l rt_C.large=1 -l h_rt=1:0:0 -v WORKDIR=/path/to/arterarejo/tokenized/commentary,IS_SGE=yes commentary/run.sh
qsub -g (your group) -l rt_C.large=1 -l h_rt=3:0:0 -v WORKDIR=/path/to/arterarejo/tokenized/crawl15,IS_SGE=yes crawl15/run.sh
qsub -g (your group) -l rt_C.large=1 -l h_rt=3:0:0 -v WORKDIR=/path/to/arterarejo/tokenized/crawl16,IS_SGE=yes crawl16/run.sh
qsub -g (your group) -l rt_C.large=1 -l h_rt=3:0:0 -v WORKDIR=/path/to/arterarejo/tokenized/crawl17,IS_SGE=yes crawl17/run.sh
qsub -g (your group) -l rt_C.large=1 -l h_rt=3:0:0 -v WORKDIR=/path/to/arterarejo/tokenized/crawl18,IS_SGE=yes crawl18/run.sh
qsub -g (your group) -l rt_C.large=1 -l h_rt=6:0:0 -v WORKDIR=/path/to/arterarejo/tokenized/crawl19,IS_SGE=yes crawl19/run.sh
qsub -g (your group) -l rt_C.large=1 -l h_rt=1:0:0 -v WORKDIR=/path/to/arterarejo/tokenized/europarl,IS_SGE=yes europarl/run.sh
```
