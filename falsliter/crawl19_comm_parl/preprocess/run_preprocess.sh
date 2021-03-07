set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    . ../../../start.sh
fi

zcat "tmp/dat.${N}.gz" | falsliter-preprocess 2 "tmp/src.${N}.npy" "tmp/trg.${N}.npy"

