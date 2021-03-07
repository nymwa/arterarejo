set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../../start.sh
fi

cat ../../../corpora/bea19/eval/ABCN.dev.bea19.orig | reguligilo -a | pyspm_encode --model_file ../../../bpe/crawl19_16000/crawl19.16000.model > valid.src
cat ../../../corpora/bea19/eval/ABCN.test.bea19.orig | reguligilo -a | pyspm_encode --model_file ../../../bpe/crawl19_16000/crawl19.16000.model > test.src

