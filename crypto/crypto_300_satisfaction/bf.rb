def seek(eip,code,dir)
    count=1
    open = {1=>?[,-1=>?]}
    close = {1=>?],-1=>?[}
    while count != 0 do
        eip+=dir
        return code.length if not (0..code.length-1).include? eip
        if code[eip]== open[dir] then  count+=1 end
        if code[eip]== close[dir] then count-=1 end
    end
    eip
end

def bfdo(code)
    memsize=100
    mem=Array.new(memsize){0}
    eip=0
    ptr=memsize/2
    retval=""
    loops=0
    while eip < code.length and loops < 1000 do
        loops+=1
        cmd=code[eip]
        case cmd
            when ?+ then mem[ptr]+=1
            when ?- then mem[ptr]-=1
            when ?> then ptr+=1
            when ?< then ptr-=1
            when ?[ then
              if mem[ptr] == 0 then eip=seek(eip,code,1) end
            when ?] then
              if mem[ptr] != 0 then eip=seek(eip,code,-1) end
            when ?. then retval+=mem[ptr].chr if mem[ptr]>0 and mem[ptr]<=255
            else #bf ignores any other char and treats them as a comment
        end
        eip+=1
        ptr=ptr%memsize
    end

    retval
end
