set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

zcat ../../corpora/wmt/europarl-v9.en.gz \
    | parallel --pipe -j 40 -k --L 10000 en_erg_preprocess \
    | progress \
    | pigz -c > labeled.gz

