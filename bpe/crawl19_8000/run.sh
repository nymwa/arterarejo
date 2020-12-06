set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

if [ -z $SGE_LOCALDIR ] ; then
    mkdir tmp
    SGE_LOCALDIR=tmp
fi

echo '□' > ${SGE_LOCALDIR}/normalized.txt
echo '▨' >> ${SGE_LOCALDIR}/normalized.txt
for X in `seq 2 100000` ; do
    echo '□' >> ${SGE_LOCALDIR}/normalized.txt
    echo '▨' >> ${SGE_LOCALDIR}/normalized.txt
done
zcat ../../tokenized/crawl19/tokenized.gz \
    | parallel --pipe -j 40 -k --L 100000 "reguligilo -lz" \
    | progress >> ${SGE_LOCALDIR}/normalized.txt
zcat ../../tokenized/commentary/tokenized.gz \
    | parallel --pipe -j 40 -k --L 100000 "reguligilo -lz" \
    | progress >> ${SGE_LOCALDIR}/normalized.txt
zcat ../../tokenized/europarl/tokenized.gz \
    | parallel --pipe -j 40 -k --L 100000 "reguligilo -lz" \
    | progress >> ${SGE_LOCALDIR}/normalized.txt
pyspm_train \
    --input ${SGE_LOCALDIR}/normalized.txt \
    --corpus_name crawl19 \
    --vocab_size 8000 \
    --model_type bpe \
    --character_coverage 1.0

