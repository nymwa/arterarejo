set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    . ../../../start.sh
fi

mkdir ${N}
cd ${N}
falsliter-dump ../../train/${N}/checkpoints/checkpoint19.pt score.dat

