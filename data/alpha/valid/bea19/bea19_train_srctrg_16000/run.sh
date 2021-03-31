set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../../../../start.sh
fi

VALIDM2=../../../../../corpora/bea19/train/wi+locness/wi+locness/m2/ABCN.dev.gold.bea19.m2

BPEMODEL=../../../../../bpe/bea19_train_srctrg_16000/bea19_train_srctrg.16000.model

m2_to_src < $VALIDM2 | reguligilo -a | pyspm_encode --model_file $BPEMODEL > valid.src
m2_to_trg < $VALIDM2 | reguligilo -a | pyspm_encode --model_file $BPEMODEL > valid.trg

