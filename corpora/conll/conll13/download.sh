if [[ -z $WORKDIR ]] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

wget -nc https://www.comp.nus.edu.sg/~nlp/conll13st/release2.3.1.tar.gz
tar -zxvf release2.3.1.tar.gz
