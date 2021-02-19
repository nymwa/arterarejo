if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

wget -nc https://www.comp.nus.edu.sg/~nlp/conll14st/conll14st-test-data.tar.gz
tar -zxvf conll14st-test-data.tar.gz
