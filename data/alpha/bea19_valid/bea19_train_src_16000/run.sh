set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../../start.sh
fi

cat ../../../../corpora/bea19/train/wi+locness/wi+locness/m2/ABCN.dev.gold.bea19.m2 | m2_to_src | reguligilo -a | pyspm_encode --model_file ../../../../bpe/bea19_train_src_16000/bea19_train_src.16000.model > valid.src
cat ../../../../corpora/bea19/train/wi+locness/wi+locness/m2/ABCN.dev.gold.bea19.m2 | m2_to_trg | reguligilo -a | pyspm_encode --model_file ../../../../bpe/bea19_train_src_16000/bea19_train_src.16000.model > valid.trg

