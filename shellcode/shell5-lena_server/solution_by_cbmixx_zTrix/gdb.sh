#!/bin/bash

pid=`pidof lena_server`
if [[ -n $pid ]]; then
    kill $pid
    echo "[ KILL ] $pid"
fi

#( echo "set follow-fork-mode child"; echo "b *0x0804A8BA"; echo "b *0x080490f0";echo "b *0x080490dd"; echo "run"; cat ) | gdb -x ~/.gdbinit ./lena_server
#( echo "set follow-fork-mode child"; echo "b *0x0804A8BA"; echo "b *0x080490f0";echo "b *0x0804902b"; echo "run"; cat ) | gdb -x ~/.gdbinit ./lena_server
gdb -x ~/.gdbinit -x gdb.x ./lena_server
