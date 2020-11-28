set -ex

BASEDIR=$(cd $(dirname $0); pwd)
for N in `seq 0 99` ; do
    qsub -g gaa50004 -l rt_C.small=1 -l h_rt=1:0:0 -v WORKDIR="$BASEDIR",SGE_QSUB="yes",N=${N} $BASEDIR/run_preprocess.sh
done
