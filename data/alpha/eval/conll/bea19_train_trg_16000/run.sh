set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../../../../start.sh
fi

VALIDM2=../../../../../corpora/conll/conll13/release2.3.1/original/data/official-preprocessed.m2 
TESTM2=../../../../../corpora/conll/conll14/conll14st-test-data/noalt/official-2014.combined.m2

BPEMODEL=../../../../../bpe/bea19_train_trg_16000/bea19_train_trg.16000.model

m2_to_src < $VALIDM2 | reguligilo -a | pyspm_encode --model_file $BPEMODEL > valid.src
m2_to_trg < $VALIDM2 | reguligilo -a | pyspm_encode --model_file $BPEMODEL > valid.trg
m2_to_src < $TESTM2  | reguligilo -a | pyspm_encode --model_file $BPEMODEL > test.src
m2_to_trg < $TESTM2  | reguligilo -a | pyspm_encode --model_file $BPEMODEL > test.trg

