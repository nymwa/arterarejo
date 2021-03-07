### run directly
`sh run.sh`

### run by qsub
```
BASEDIR=$(cd $(dirname $0); pwd)
qsub -v WORKDIR="$BASEDIR",IS_SGE="yes" $BASEDIR/run.sh
```
