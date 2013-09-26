In a minesweeper game, you try to open a square and it leadto several diffirent results:

* you open a mine, game over
* you open a clear square with some mines nearby, the sum of mines around will be provided
* you open a clear square with no mines nearby, square around will be opened recursively and automatically

I wrote a script to solve this problem, but all stucked at level 7, size: 10x10x10 with 150 mines.

Train of thought:

* open a random square when no certain move
* when the sum of unopened around one square equals the mine sum, I mark these unopened as mine with a flag
* when the sum of unopened marked as mine around one square, open the others

The random move often run up against the mine, clear the levels is a rare event, impossible in another word.

So I try to calculate the probability of every unopen, and take the mininum one when stuck, then fail decreased obviously.

[Solution](solve.py)
