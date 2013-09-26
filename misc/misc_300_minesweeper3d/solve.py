#!/usr/bin/env python
# -*- coding: utf-8 -*-

import socket
import re
import random

s = socket.socket()
print 'Connecting...'
# s.connect(('188.40.147.121', 9999))
s.connect(('localhost', 9999))

# numbers => the number of mines around this block
# FLAG => marked as mine, UNKNOWN => unopened and unknown
FLAG = -1
UNKNOWN = -2
rg = (-1, 0, 1)


class Game:

    def __init__(self, level_str):
        self.level_str = level_str
        match = re.match(r'level (\d+), size: (\d+)x(\d+)x(\d+) with (\d+) mines', self.level_str)
        if match:
            groups = match.groups()
            self.level = int(groups[0])
            self.width = int(groups[1])
            self.height = int(groups[2])
            self.depth = int(groups[3])
            self.mines = int(groups[4])
        else:
            print 'level error : %s' % level_str
            exit()
        self.flags = 0
        self.opens = 0
        self.box = [[[UNKNOWN for i in xrange(self.depth)] for i in xrange(self.height)] for i in xrange(self.width)]


def send(msg, debug=False):
    if debug:
        print msg
    s.send(msg + '\n')
    data = ''
    while True:
        data += s.recv(1024)
        if data.find('\n\n') > 0:
            break
    if debug:
        print data
    return data


# determine whether a block can be opened, FLAG => mark this block as mine
def solveone(x, y, z):
    flag_count = 0
    unknown_count = 0
    # calculate the sum of blocks already flaged and blocks unknown
    for i in rg:
        if x+i < 0 or x+i >= game.width:
            continue
        for j in rg:
            if y+j < 0 or y+j >= game.height:
                continue
            for k in rg:
                if z+k < 0 or z+k >= game.depth:
                    continue
                if game.box[x+i][y+j][z+k] == FLAG:
                    flag_count += 1
                if game.box[x+i][y+j][z+k] == UNKNOWN:
                    unknown_count += 1
    # mines found
    if unknown_count + flag_count == game.box[x][y][z]:
        for i in rg:
            if x+i < 0 or x+i >= game.width:
                continue
            for j in rg:
                if y+j < 0 or y+j >= game.height:
                    continue
                for k in rg:
                    if z+k < 0 or z+k >= game.depth:
                        continue
                    if game.box[x+i][y+j][z+k] == UNKNOWN:
                        game.box[x+i][y+j][z+k] = FLAG
                        game.flags += 1
    # mines around this block already enough, open others
    elif flag_count == game.box[x][y][z]:
        for i in rg:
            if x+i < 0 or x+i >= game.width:
                continue
            for j in rg:
                if y+j < 0 or y+j >= game.height:
                    continue
                for k in rg:
                    if z+k < 0 or z+k >= game.depth:
                        continue
                    if game.box[x+i][y+j][z+k] == UNKNOWN:
                        parse(send('%s,%s,%s' % (x+i, y+j, z+k)))


def solve():
    for x in xrange(game.width):
        for y in xrange(game.height):
            for z in xrange(game.depth):
                if game.box[x][y][z] > 0:
                    solveone(x, y, z)


# read response and parse
def parse(lines):
    global result, level_str
    pattern = re.compile(r'(\d+),(\d+),(\d+):(\d+)')
    lines = lines.split('\n')
    for line in lines:
        # print line
        match = pattern.match(line)
        if match:
            groups = match.groups()
            x = int(groups[0])
            y = int(groups[1])
            z = int(groups[2])
            c = int(groups[3])
            game.box[x][y][z] = c
            game.opens += 1
        elif line.find('lost') > 0:
            print 'you_lost'
            result = 'lost'
        elif line.find('win') > 0:
            print 'you_win'
            result = 'win'
            print lines
        elif line.find('level') >= 0:
            # draw()
            level_str = line
        elif line == 'already_opened':
            # somethind goes wrong over sockets, try to fix the game
            game.flags = 0
            game.opens = 0
            for x in xrange(game.width):
                for y in xrange(game.height):
                    for z in xrange(game.depth):
                        game.box[x][y][z] = UNKNOWN
            parse(send('show'))
            solve()
            return
        elif line.find('flag') >= 0:
            print 'Got it!\n%s' % line
            s.close()
            exit()
        elif line != '':
            print 'parse error: %s' % line
    # draw()


# draw 2 2-D based graph, * => FLAG, . => unknown
def draw():
    print '%s, %s flaged, %s opened' % (game.level_str, game.flags, game.opens)
    return
    print 'level: %s' % game.level
    for z in xrange(game.depth):
        for y in xrange(game.height):
            for x in xrange(game.width):
                c = game.box[x][y][z]
                print '*' if c == FLAG else '.' if c == UNKNOWN else c,
            print
        print
        print '-' * (game.width * 2)
        print
    print '%s, %s flaged, %s opened' % (game.level_str, game.flags, game.opens)


#level 0 start
print s.recv(1024)

level_str = s.recv(1024)

while True:
    result = 'not resolved'
    print level_str
    game = Game(level_str)
    draw()
    # to start at a random block
    coor = (random.randint(0, game.width - 1), random.randint(0, game.height - 1), random.randint(0, game.depth - 1))
    print 'start at %s,%s,%s' % coor
    result = send('%s,%s,%s' % coor)
    parse(result)
    solve()
    # draw()
    last_opens = game.opens

    while True:
        old_opens = last_opens
        solve()
        last_opens = game.opens
        solve()
        draw()
        if result == 'win' or result == 'lost':
            break
        if old_opens == game.opens:
            # two round no gains, must have a try

            # get the probability to be a mine of this block from blocks around
            # which takes the minimum one
            def get_probability(x, y, z):

                def get_probability_around(x, y, z):
                    # unopened 
                    if game.box[x][y][z] <= 0:
                        return -1
                    total_mine_count = game.box[x][y][z]
                    flaged_mine_count = 0
                    unknown_count = 0
                    for i in rg:
                        if x+i < 0 or x+i >= game.width:
                            continue
                        for j in rg:
                            if y+j < 0 or y+j >= game.height:
                                continue
                            for k in rg:
                                if z+k < 0 or z+k >= game.depth:
                                    continue
                                status = game.box[x+i][y+j][z+k]
                                if status == UNKNOWN:
                                    unknown_count += 1
                                elif status == FLAG:
                                    flaged_mine_count += 1
                    return float(total_mine_count - flaged_mine_count) / unknown_count

                min_probability = 1
                for i in rg:
                    if x+i < 0 or x+i >= game.width:
                        continue
                    for j in rg:
                        if y+j < 0 or y+j >= game.height:
                            continue
                        for k in rg:
                            if z+k < 0 or z+k >= game.depth:
                                continue
                            if i == j == k == 0:
                                continue
                            probability_around = get_probability_around(x+i, y+j, z+k)
                            if probability_around != -1 and probability_around < min_probability:
                                min_probability = probability_around
                return min_probability

            def try_at(coor, probability):
                x, y, z = coor
                print 'try at %s,%s,%s, probability to be mine: %s' % (x, y, z, probability)
                result = send('%s,%s,%s' % (x, y, z))
                parse(result)
                # draw()

            min_probability = 1.0
            for z in xrange(game.depth):
                for y in xrange(game.height):
                    for x in xrange(game.width):
                        if game.box[x][y][z] != UNKNOWN:
                            continue
                        probability = get_probability(x, y, z)
                        if probability == 0:
                            continue
                        if min_probability > probability:
                            min_probability = probability
                            choice = (x, y, z)
            try_at(choice, min_probability)

