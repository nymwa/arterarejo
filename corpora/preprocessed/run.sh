set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

cat ../bea19/train/lang8/lang8.train.auto.bea19.m2 | m2_to_src > lang8.src
cat ../bea19/train/lang8/lang8.train.auto.bea19.m2 | m2_to_trg > lang8.trg
remove_identical lang8.src lang8.trg lang8.identical_removed.src lang8.identical_removed.trg
paste lang8.identical_removed.src lang8.identical_removed.trg > lang8.identical_removed.tsv

