#!/usr/bin/env python

def last(w):
    if len(w) == 4 and w[0] in 'bdfhjlnpr' and w[1] in 'hjlnpruwy' and w[2] in 'abcdef' and w[3] in 'efghij':
        print 'last:', w

def sec(w):
    if len(w) == 3 and w[0] in 'noqstvwy' and w[1] in 'hkmoqsvxz' and w[2] in 'dfhkmoqsuw':
        print 'second:', w, len(w)

def third(w):
    if len(w) == 7 and w[0] in 'defghi' and w[1] in 'Anopqst' and w[2] in 'ortvy' and w[3] in 'acegikmoqs' and w[4] in 'mopqrs' and w[5] in 'Zacegik' and w[6] in 'bdfhjl':
        print 'third:', w

def fourth(w):
    if len(w) == 

for line in open('wordsEn.txt'):
    w = line[:-1].strip()
    #sec(w)
    #last(w)
    third(w)

