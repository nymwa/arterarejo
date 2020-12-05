set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    . ../../start.sh
fi

zcat ../../corpora/wmt/europarl-v9.en.gz \
    ../../corpora/wmt/news-commentary-v15.en.gz \
    ../../corpora/wmt/news.2019.en.shuffled.deduped.gz \
    | sort \
    | uniq \
    | perl -MList::Util -e 'srand 0; print List::Util::shuffle <>' \
    | progress \
    | pigz -c > shuffled.gz

zcat shuffled.gz \
    | parallel --pipe -j 40 -k --L 10000 en_erg_preprocess --remove-non-english \
    | progress \
    | pigz -c > labeled.gz

