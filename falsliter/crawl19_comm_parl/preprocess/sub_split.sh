set -ex

BASEDIR=$(cd $(dirname $0); pwd)
qsub -g gaa50004 -l rt_C.small=1 -l h_rt=1:0:0 -v WORKDIR="$BASEDIR",SGE_QSUB="yes" $BASEDIR/run_split.sh
