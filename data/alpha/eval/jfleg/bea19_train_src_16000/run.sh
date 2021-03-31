set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../../../../start.sh
fi

VALIDSRC=../../../../../corpora/jfleg/jfleg/dev/dev.src
TESTSRC=../../../../../corpora/jfleg/jfleg/test/test.src

BPEMODEL=../../../../../bpe/bea19_train_src_16000/bea19_train_src.16000.model

reguligilo -a < $VALIDSRC | pyspm_encode --model_file $BPEMODEL > valid.src
reguligilo -a < $TESTSRC  | pyspm_encode --model_file $BPEMODEL > test.src

