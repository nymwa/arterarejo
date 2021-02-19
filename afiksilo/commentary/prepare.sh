set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

zcat \
    ../../tokenized/commentary/normalized.gz \
    | afiksilo_prepare > frequency.tsv

