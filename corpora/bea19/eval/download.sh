if [ -z $WORKDIR ] ; then
    WORKDIR=`dirname $0`
fi
cd $WORKDIR

wget -qnc https://www.cl.cam.ac.uk/research/nl/bea2019st/data/ABCN.dev.bea19.orig
wget -qnc https://www.cl.cam.ac.uk/research/nl/bea2019st/data/ABCN.test.bea19.orig
