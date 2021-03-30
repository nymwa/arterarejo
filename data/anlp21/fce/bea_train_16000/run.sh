set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../../start.sh
fi

cat ../../../corpora/bea19/train/fce/fce/m2/fce.dev.gold.bea19.m2 | m2_to_src | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > valid.src
cat ../../../corpora/bea19/train/fce/fce/m2/fce.dev.gold.bea19.m2 | m2_to_trg | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > valid.trg
cat ../../../corpora/bea19/train/fce/fce/m2/fce.test.gold.bea19.m2 | m2_to_src | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > test.src
cat ../../../corpora/bea19/train/fce/fce/m2/fce.test.gold.bea19.m2 | m2_to_src | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > test.trg

