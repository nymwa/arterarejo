set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    . ../../../start.sh
fi

mkdir tmp

DAT="tmp/dat.0.gz"
for N in `seq 1 99` ; do
    DAT=${DAT}:"tmp/dat.${N}.gz"
done

zcat \
    ../../../tokenized/commentary/normalized.gz \
    ../../../tokenized/crawl19/normalized.gz \
    ../../../tokenized/europarl/normalized.gz \
    | falsliter-data-split ${DAT}

