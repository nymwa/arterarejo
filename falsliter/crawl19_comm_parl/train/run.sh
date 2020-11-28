set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    . ../../../start.sh
fi

mkdir ${N}
cd ${N}
falsliter-train ../../preprocess/src.npy ../../preprocess/trg.npy --max-epoch 20 | tee log.txt

