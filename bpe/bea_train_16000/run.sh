set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

if [ -z $SGE_LOCALDIR ] ; then
    mkdir tmp
    SGE_LOCALDIR=tmp
fi

cat \
    ../../corpora/bea19/train/fce/fce/m2/fce.train.gold.bea19.m2 \
    ../../corpora/bea19/train/nucle/release3.3/bea2019/nucle.train.gold.bea19.m2 \
    ../../corpora/bea19/train/wi+locness/wi+locness/m2/A.train.gold.bea19.m2 \
    ../../corpora/bea19/train/wi+locness/wi+locness/m2/B.train.gold.bea19.m2 \
    ../../corpora/bea19/train/wi+locness/wi+locness/m2/C.train.gold.bea19.m2 \
    | m2_to_trg | reguligilo -lz > normalized.txt
cut -f 2 ../../corpora/preprocessed/lang8.identical_removed.tsv | reguligilo -lz >> normalized.txt

pyspm_train \
    --input normalized.txt \
    --corpus_name bea_train \
    --vocab_size 16000 \
    --model_type bpe \
    --character_coverage 1.0 \
    --required_chars ''

