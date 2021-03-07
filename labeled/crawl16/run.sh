set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

zcat ../../corpora/wmt/news.2016.en.shuffled.deduped.gz \
    | parallel --pipe -j 40 -k --L 10000 en_erg_preprocess --remove-non-english \
    | progress \
    | pigz -c > labeled.gz

