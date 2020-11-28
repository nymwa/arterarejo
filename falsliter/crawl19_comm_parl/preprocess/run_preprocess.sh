set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    . ../../../start.sh
fi

zcat "tmp/dat.${N}.gz" | falsliter-preprocess 2 "tmp/src.${N}.npy" "tmp/trg.${N}.npy"

