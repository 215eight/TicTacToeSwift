# TicTacToeSwift
Tic Tac Toe written in Swift - Do you think you can win? Give it a try!

## Concepts

* __Symbol__: A nought (O) or a cross (X)

* __Position__: A zero-based numeric value that indicates the relative location of a given position within a delimited space with an specific layout 

* __Board__: A rectangular array of N x N positions. The first position is located at the top left corner of the board. Position increments its value horizontally until a row ends. The next position is the right-most location in the row below. Below an example of a 3 x 3 grid

```
| 0 | 1 | 2 |
| 3 | 4 | 5 |
| 6 | 7 | 8 |
```

Each position in the board can hold a symbol. All positions start empty. Its value can only be changed once.

* __Position Names__: Each position within a board has a name depending its realtive location.

  + Edge: A position located on the edge that is not at the begining of a row or column
  + Corner: A position bordered by two edge positions
  + Center: A position located not on the edge

```
|corner |edge   |corner |
|edge   |center |edge   |
|corner |edge   |corner |
```

* __Units__: N number of contiguos positions aligned either horizontally, vertically or diagonally

Horizontal Unit
```
|   X   |       |       |
|   X   |       |       |
|   X   |       |       |
```

Vertical Unit
```
|   X   |   X   |   X   |
|       |       |       |
|       |       |       |
```

Diagonal Unit
```
|   X   |       |       |
|       |   X   |       |
|       |       |   X   |
```

* __Units for Position__: Each position within a board belongs to a mixum of 3 units, one horizontal, one vertical and one diagonal. Some exmaples

  + Position 0: Belongs to a horizontal unit (first row), a vertical unit (first column) and a diagonal unit
  + Position 3: Belongs to a horizontal unit and a vertical unit, but not a diagonal unit


