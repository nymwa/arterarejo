if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

wget -nc https://www.cl.cam.ac.uk/research/nl/bea2019st/data/wi+locness_v2.1.bea19.tar.gz
tar -zxvf wi+locness_v2.1.bea19.tar.gz
