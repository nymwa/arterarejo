set -ex

if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [ -n $SGE_QSUB ] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

afiksilo_make_model frequency.tsv afiksilo_dict.pickle --min-freq 3 --min-length 3

