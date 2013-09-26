#!/usr/bin/env python
import struct, sys
import pyparsing

class Register:
	names = {"$ip": 0, "$sp": 1, "$fr": 2, "$sc": 3, "$s1": 4, "$s2": 5, "$sr": 3}
	for i in xrange(0,16):
		names["$r%d" % i] = i
	parser = pyparsing.oneOf(names.keys()).setParseAction( lambda s,l,t: [ Register(t[0]) ] )

	def __init__(self, name):
		self.num = Register.names[name]

	def __len__(self):
		return 4

	def __repr__(self):
		return "Register<%d>" % self.num

class LabelRel:
	parser = (pyparsing.Word(pyparsing.alphas + "_", pyparsing.alphanums + "_")).setParseAction( lambda s,l,t: [ LabelRel(t[0]) ] )

	def __init__(self, name):
		self.name = name
		self.num = -1

	def __len__(self):
		return 8

	def __repr__(self):
		return "LabelRel<%d, %s>" % (self.num, self.name)

class LabelAbs:
	parser = (pyparsing.Word(pyparsing.alphas + "_", pyparsing.alphanums + "_")).setParseAction( lambda s,l,t: [ LabelAbs(t[0]) ] )

	def __init__(self, name):
		self.name = name
		self.num = -1

	def __len__(self):
		return 8

	def __repr__(self):
		return "LabelAbs<%d, %s>" % (self.num, self.name)

class Flag:
	names = {"eq": 0, "gt": 1, "lt": 2, "null": 3, "signed": 4}
	for i in xrange(0,16):
		names["f%d" % i] = i
	parser = pyparsing.oneOf(names.keys()).setParseAction( lambda s,l,t: [ Flag(t[0]) ] )

	def __init__(self, name):
		self.num = Flag.names[name]

	def __len__(self):
		return 4

	def __repr__(self):
		return "Flag<%d>" % self.num

class Char:
	parser = (pyparsing.Suppress(pyparsing.Literal("'")) + pyparsing.Word(pyparsing.printables + ' ', exact=1) + pyparsing.Suppress(pyparsing.Literal("'"))).setParseAction( lambda s,l,t: [ Char(t[0]) ] )

	def __init__(self, char):
		self.num = ord(char)

	def __len__(self):
		return 8

	def __repr__(self):
		return "Char<%d>" % self.num

class Number:
	parser = pyparsing.Word(pyparsing.nums + "+-", pyparsing.nums).setParseAction( lambda s,l,t: [ Number(t[0]) ] )

	def __init__(self, num):
		self.num = int(num)

	def __len__(self):
		return 8

	def __repr__(self):
		return "Number<%d>" % self.num

immediate_parser = Number.parser ^ LabelAbs.parser ^ Char.parser
immediate_offset_parser = Number.parser ^ LabelRel.parser
immediate_word_parser = Number.parser ^ LabelAbs.parser

class Instruction:
	def __init__(self, mode, num, args):
		self.mode = 3 - mode
		self.num = num
		self.args = args

	def generate(self):
		pos = self.mode * 4
		num = self.num << pos
		pos += 4
		for a in self.args:
			l = len(a)
			if a.num < 0:
				a.num += 2**l
			if a.num >= 2**l:
				a.num = a.num % (2**l)
			num |= a.num << pos
			pos += len(a)
		return struct.pack("H", num)

	def __repr__(self):
		return "Instruction<%d, %d, %s>" % (self.mode, self.num, self.args)

	def __len__(self):
		return 2

class InstructionAdd(Instruction):
	def generate(self):
		if self.args[1].num > self.args[2].num:
			tmp = self.args[2]
			self.args[2] = self.args[1]
			self.args[1] = tmp
		elif self.args[1].num == self.args[2].num:
			self.mode = 2
			self.num = 13
			self.args.pop_back()
		return Instruction.generate(self)

class InstructionMul(Instruction):
	def generate(self):
		if self.args[1].num < self.args[2].num:
			tmp = self.args[2]
			self.args[2] = self.args[1]
			self.args[1] = tmp
		return Instruction.generate(self)

class InstructionAnd(Instruction):
	def generate(self):
		if self.args[1].num > self.args[2].num:
			tmp = self.args[2]
			self.args[2] = self.args[1]
			self.args[1] = tmp
		return Instruction.generate(self)

class InstructionOr(Instruction):
	def generate(self):
		if self.args[1].num < self.args[2].num:
			tmp = self.args[2]
			self.args[2] = self.args[1]
			self.args[1] = tmp
		return Instruction.generate(self)

class InstructionMovU(Instruction):
	def generate(self):
		if isinstance(self.args[1], LabelAbs):
			self.args[1].num = self.args[1].num >> 8
		return Instruction.generate(self)

class InstructionDataB(Instruction):
	def generate(self):
		return chr(self.args[0].num)

	def __len__(self):
		return 1

class InstructionDataW(Instruction):
	def generate(self):
		return struct.pack("H", self.args[0].num)

class InstructionSpace(Instruction):
	def generate(self):
		return chr(0) * self.args[0].num

	def __len__(self):
		return self.args[0].num

instructions = []
for i in [
	(0,  "datab",   "b", InstructionDataB),
	(0,  "dataw",   "w", InstructionDataW),
	(0,  "space",   "w", InstructionSpace),

	(1,  "add",    "tss", InstructionAdd),
	(1,  "mul",    "tss", InstructionMul),
	(2,  "sub",    "tss"),
	(3,  "div",    "tss"),
	(4,  "mod",    "tss"),
	(5,  "xor",    "tss"),
	(6,  "and",    "tss", InstructionAnd),
	(6,  "or",     "tss", InstructionOr),
	(7,  "shl",    "tss"),
	(8,  "shr",    "tss"),
	(9,  "rol",    "tss"),
	(10, "ror",    "tss"),
	(11, "mov",    "tb"),
	(12, "movl",   "tb"),
	(13, "movu",   "tb", InstructionMovU),
	(14, "jmpif",  "fo"),
	(15, "jmpifn", "fo"),

	(1,  "mov", "ts"),
	(2,  "xchg", "tt"),
	(3,  "call", "o"),
	(4,  "jmp", "o"),
	(5,  "loadb", "ts"),
	(6,  "storb", "ss"),
	(7,  "loadw", "ts"),
	(8,  "storw", "ss"),
	(9,  "push", "b"),
	(10, "jmpif", "fs"),
	(11, "jmpifn", "fs"),
	(12, "cmp", "ss"),
	(13, "dbl", "ts"),

	(1,  "call", "s"),
	(2,  "jmp", "s"),
	(3,  "test", "t"),
	(4,  "inc", "t"),
	(5,  "dec", "t"),
	(6,  "pushb", "s"),
	(7,  "pushw", "s"),
	(8,  "popb", "t"),
	(9,  "popw", "t"),
	(10, "switch", "t"),
	(11, "sysret_jmp", "s"),

	(1, "ret", ""),
	(2, "syscall", ""),
	(3, "debug", ""),
	(4, "sysret", ""),
]:
	if len(i) == 3:
		cls = Instruction
		num, name, args = i
	elif len(i) == 4:
		num, name, args, cls = i
	else:
		assert(False)
	mode = 0
	arguments = []
	for a in args:
		if len(arguments) != 0:
			arguments.append(pyparsing.Suppress(pyparsing.Literal(",")))
		if a in "fst":
			mode += 1
			if a == "f":
				arguments.append(Flag.parser)
			else:
				arguments.append(Register.parser)
		elif a == "o":
			mode += 2
			arguments.append(immediate_offset_parser)
		elif a == "b":
			mode += 2
			arguments.append(immediate_parser)
		elif a == "w":
			arguments.append(immediate_word_parser)
	if len(arguments) != 0:
		instructions.append((pyparsing.CaselessKeyword(name) + pyparsing.Group(pyparsing.And(arguments))).setParseAction((lambda c, m, n: (lambda s,l,t: [c(m, n, t[1])]))(cls, mode, num)))
	else:
		instructions.append(pyparsing.CaselessKeyword(name).setParseAction((lambda c, m, n: (lambda s,l,t: [c(m, n, [])]))(cls, mode, num)))
parser = pyparsing.ZeroOrMore(LabelAbs.parser + pyparsing.Suppress(pyparsing.Literal(":"))) + pyparsing.Optional(pyparsing.Or(instructions))

#parse input file
labels = {}
instructions = []
offset = 0
with open(sys.argv[1]) as f:
	line_num=0
	for l in f.read().split("\n"):
		line_num += 1
		if len(l) == 0 or l[0] == "#":
			continue
		try:
			r = parser.parseString(l,  parseAll=True)
		except pyparsing.ParseException as e:
			print "Error at line %d: %s" % (line_num, e)
			print l
			print (" " * (e.col - 1)) + "^"
			sys.exit(1)
		for i in r:
			i.line = line_num
			if isinstance(i, LabelRel) or isinstance(i, LabelAbs):
				if i.name in labels:
					print "Error at line %d: %s" % (line_num, "Duplicate label")
					sys.exit(1)
				labels[i.name] = offset
				continue
			offset += len(i)
			instructions.append(i)

#fill label references and produce code
with open(sys.argv[2], "w") as f:
	pos = 0
	for i in instructions:
		pos += len(i)
		for a in i.args:
			if isinstance(a, LabelAbs):
				if a.name not in labels:
					print "Error at line %d: Undefined Label %s" % (i.line, a.name)
					sys.exit(1)
				a.num = labels[a.name]
				print "Label %s at %d set to %d (abs)" % (a.name, pos, a.num)
			elif isinstance(a, LabelRel):
				if a.name not in labels:
					print "Error at line %d: Undefined Label %s" % (i.line, a.name)
					sys.exit(1)
				a.num = labels[a.name] - pos
				if a.num >= 128 or a.num < -128:
					print "Error at line %d: Label %s too far" % (i.line, a.name)
					sys.exit(1)
				assert(a.num < 128)
				assert(a.num >= -128)
				print "Label %s at %d set to %d (rel)" % (a.name, pos, a.num)
		f.write(i.generate())
