CXFLAGS?= -std=c++11 -O0
LD=g++
OBJECTS= main.o
TARGETS= main ls cmd exit hexdump hexpaste debug uname bios.bin exploit

all: $(TARGETS)

%: %.asm
	./assembler.py $< $@

main: $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $+

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -g -c -o $@ $<

clean:
	rm $(TARGETS) $(OBJECTS)
