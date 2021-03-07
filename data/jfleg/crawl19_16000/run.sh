set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../../start.sh
fi

cat ../../../corpora/jfleg/jfleg/dev/dev.src | reguligilo -a | pyspm_encode --model_file ../../../bpe/crawl19_16000/crawl19.16000.model > valid.src
cat ../../../corpora/jfleg/jfleg/test/test.src | reguligilo -a | pyspm_encode --model_file ../../../bpe/crawl19_16000/crawl19.16000.model > test.src

