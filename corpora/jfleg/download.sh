if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

git clone https://github.com/keisks/jfleg.git
