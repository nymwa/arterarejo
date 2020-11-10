set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

zcat ../../corpora/wmt/news.2018.en.shuffled.deduped.gz \
    | parallel --pipe -j 40 -k --L 10000 en_erg_tokenizer \
    | progress \
    | pigz -c > tokenized.gz
zcat tokenized.gz \
    | parallel --pipe -j 40 -k --L 100000 reguligilo \
    | progress \
    | pigz -c > normalized.gz

