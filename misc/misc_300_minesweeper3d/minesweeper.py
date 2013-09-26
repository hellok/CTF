#!/usr/bin/env python2
import signal, socket, random, sys, os, re

flag = "SIGINT_KXZABPSUEZONNPJTXFSGMBVUOFJNZFJW"
signal.signal(signal.SIGCHLD, signal.SIG_IGN)

levels = [(16,30,1,20),] * 100
levels += [
(10,10,10,10),
(10,10,10,15),
(10,10,10,20),
(20,20,20,15),
(20,20,20,20),
(30,30,30,15),
(30,30,30,20),
(40,40,40,15),
(40,40,40,20),
(50,50,1,30),
(50,1,50,30),
(1,50,50,30),
]

s = socket.socket()
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind(("0.0.0.0", 8888))
s.listen(10)
while 1:
	c, _ = s.accept()
	if c is None:
		sys.exit(1)
	if os.fork() == 0:
		break
	del c

class Field:
	def __init__(self, dx, dy, dz, mines):
		self.dx, self.dy, self.dz = dx, dy, dz
		self.opened = {}
		self.mines = []
		self.nmines = mines
		random.seed()

	def around(self, x, y, z):
		for dx in xrange(-1, 2):
			for dy in xrange(-1, 2):
				for dz in xrange(-1, 2):
					if dx == 0 and dy == 0 and dz == 0:
						continue
					nx = x + dx
					ny = y + dy
					nz = z + dz
					if min(nx, ny, nz) < 0 or nx >= self.dx or ny >= self.dy or nz >= self.dz:
						continue
					yield (nx, ny, nz)

	def dump(self):
		return "".join("%d,%d,%d:%d\n" % (x, y, z, self.opened[(x,y,z)]) for x,y,z in self.opened.keys())

	def open(self, x, y, z):
		p = (x, y, z)
		if min(p) < 0 or x >= self.dx or y >= self.dy or z >= self.dz:
			return "illegal_move\n"
		if len(self.opened) == 0:
			nogo = [p] + list(self.around(x,y,z))
			for _ in xrange(0, self.nmines):
				while 1:
					m = tuple(random.randint(0, d - 1) for d in (dx, dy, dz))
					if m not in self.mines and m not in nogo:
						break
				self.mines.append(m)
		if p in self.opened:
			return "already_opened\n"
		if p in self.mines:
			return "you_lost\n"
		self.opened[p] = 0
		for a in self.around(x,y,z):
			if a in self.mines:
				self.opened[p] += 1
		data = "%d,%d,%d:%d\n" % (x, y, z, self.opened[p])
		if self.opened[p] == 0:
			for ox, oy, oz in self.around(x,y,z):
				if (ox, oy, oz) not in self.opened:
					data += self.open(ox, oy, oz)
		if len(self.mines) + len(self.opened) == self.dx * self.dy * self.dz:
			data += "you_win\n"
		return data

c.sendall("""#
#Welcome to MineSweeper 3D !!!
#
#Commands:
#- show: dump the opened fields
#- [0-9]+,[0-9]+,[0-9]+: open a coordinate
#
#Have Fun.
#
""")
level = 0
dx,dy,dz,nm = levels[level]
nm *= dx * dy * dz / 100
f = Field(dx,dy,dz,nm)
c.sendall("level %d, size: %dx%dx%d with %d mines\n\n" % (level, dx,dy,dz,nm))
data = ""
o = re.compile("^[0-9]+,[0-9]+,[0-9]+$")
while 1:
	new_data = c.recv(4096)
	data += new_data
	if new_data == "":
		break
	lines = data.split("\n")
	data = lines.pop()
	for l in lines:
		print l
		if l == "show":
			c.sendall(f.dump() + "\n")
			continue
		elif o.match(l):
			x, y, z = (int(i) for i in l.split(","))
			r = f.open(x, y, z)
			if r == "you_lost\n":
				dx,dy,dz,nm = levels[level]
				nm *= dx * dy * dz / 100
				f = Field(dx,dy,dz,nm)
				r += "level %d, size: %dx%dx%d with %d mines\n" % (level, dx,dy,dz,nm)
			if r[-8:] == "you_win\n":
				level += 1
				if level >= len(levels):
					r += "flag: %s\n" % flag
					level -= 1
				dx,dy,dz,nm = levels[level]
				nm *= dx * dy * dz / 100
				f = Field(dx,dy,dz,nm)
				r += "level %d, size: %dx%dx%d with %d mines\n" % (level, dx,dy,dz,nm)
			print r
			c.sendall(r + "\n")
		else:
			c.sendall("unknown command: %s\n\n" % `l`)
	else:
		continue
	break
