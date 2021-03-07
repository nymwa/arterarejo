set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

if [[ -n $IS_SGE ]] ; then
    . /etc/profile.d/modules.sh
    source ../../start.sh
fi

ortobruilo-prepare ../../afiksilo/all/frequency.tsv orto_dict.pickle --min-freq 500

