Andi's Game of Life
===================

This is a Curses-implementation of
[Conway's Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life)

    git pull https://github.com/iboard/agol.git
    cd agol
    ruby agol.rb

Then press a number-key between 1 and 9 (init the grid with randomly
alive or dead cells.

Press c to change the colors (randomly)

Press any other key than q to calculate the next cycle

Press q to quit

Have fun!

[Watch in action](https://plus.google.com/u/0/116071098827301487282/posts/2NrnsczFDK5)

          X   X X         |
        X   X     X X   X |
        X X X     X X X X |
            X X X X   X   |
        X X X X   X     X |
          X   X   X     X |
        X X X X X X X X   |
          X       X X     |
          X   X     X     |
         ------------------
        1-9=init grid, q=quit, c=change color, any other key = cycle [44 cells alive]
