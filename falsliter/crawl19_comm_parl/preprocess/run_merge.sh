set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    . ../../../start.sh
fi

SRC="tmp/src.0.npy"
TRG="tmp/trg.0.npy"
for N in `seq 1 99` ; do
    SRC=${SRC}:"tmp/src.${N}.npy"
    TRG=${TRG}:"tmp/trg.${N}.npy"
done

falsliter-data-merge $SRC $TRG src.npy trg.npy
#rm -rf tmp
