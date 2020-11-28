set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    . ../../../start.sh
fi

SRC="../dump/0/score.dat"
for N in `seq 1 9` ; do
    SRC=${SRC}:"../dump/${N}/score.dat"
done

falsliter-merge-model 2 $SRC score.dat

