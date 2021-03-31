set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../../../start.sh
fi

VALIDM2=../../../../corpora/bea19/train/fce/fce/m2/fce.dev.gold.bea19.m2
TESTM2=../../../../corpora/bea19/train/fce/fce/m2/fce.test.gold.bea19.m2

m2_to_src < $VALIDM2 > valid.src
m2_to_trg < $VALIDM2 > valid.trg
m2_to_src < $TESTM2  > test.src
m2_to_trg < $TESTM2  > test.trg

