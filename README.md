# 💎 Demo: Conway's Game of Life

Conway's Game of Life is celullar automaton devised by British mathematician John Conway in 1970. It's a `0`-player
"game" where the game state evolves by a combination of intial conditions and predefined rules.

The cells exist in a two-dimensional grid of a finite size. Each cell has `8` neighbors, except at the edges.

The rules are simple. At time-step `T+1` the following transitions occur:

1.  Any live cell with:
    1.  fewer than `2` neighbors will die of loneliness.
    2.  exactly `2` or `3` neighbors will live on.
    3.  greater than `3` will die of overcrowding.
2.  Any dead cell with exactly `3` neighbors will become a living cell.

## Up and Running

Assuming you have the Ruby version specified in the `.ruby-version` file installed, all you need to do is run bundle
and the file:

```sh
bundle
ruby run.rb
```

The program runs an endless loop.  To break out of the loop, press `Ctrl + c`.
