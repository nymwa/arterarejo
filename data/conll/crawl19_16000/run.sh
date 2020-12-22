set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    source ../../../start.sh
fi

cat ../../../corpora/conll/conll13/release2.3.1/revised/data/official-preprocessed.m2 | m2_to_src | reguligilo -a | pyspm_encode --model_file ../../../bpe/crawl19_16000/crawl19.16000.model > valid.src
cat ../../../corpora/conll/conll13/release2.3.1/revised/data/official-preprocessed.m2 | m2_to_trg | reguligilo -a | pyspm_encode --model_file ../../../bpe/crawl19_16000/crawl19.16000.model > valid.trg
cat ../../../corpora/conll/conll14/conll14st-test-data/alt/official-2014.combined-withalt.m2 | m2_to_src | reguligilo -a | pyspm_encode --model_file ../../../bpe/crawl19_16000/crawl19.16000.model > test.src

