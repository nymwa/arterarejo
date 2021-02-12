set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    source ../../../start.sh
fi

cat ../../../corpora/conll/conll13/release2.3.1/original/data/official-preprocessed.m2 | m2_to_src | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > valid.src
cat ../../../corpora/conll/conll13/release2.3.1/original/data/official-preprocessed.m2 | m2_to_trg | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > valid.trg
cat ../../../corpora/conll/conll14/conll14st-test-data/noalt/official-2014.combined.m2 | m2_to_src | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > test.src

