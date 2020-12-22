set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    source ../../../start.sh
fi

cat ../../../corpora/jfleg/jfleg/dev/dev.src | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > valid.src
cat ../../../corpora/jfleg/jfleg/test/test.src | reguligilo -a | pyspm_encode --model_file ../../../bpe/bea_train_16000/bea_train.16000.model > test.src

