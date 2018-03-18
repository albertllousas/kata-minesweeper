# Kata Minesweeper

## About this kata

http://codingdojo.org/kata/Minesweeper/

## The problem

### Minesweeper game

Have you ever played Minesweeper? It’s a cute little game which comes within a certain Operating System whose name we can’t really remember. 
Well, the goal of the game is to find all the mines within an MxN field. 
To help you, the game shows a number in a square which tells you how many mines there are adjacent to that square. 
For instance, take the following 4x4 field with 2 mines (which are represented by an * character):
```bash
*...
....
.*..
....
```
The same field including the hint numbers described above would look like this:
```bash
*100
2210
1*10
1110
```

### Problem Description

#### Input

You should write a program that takes input as follows:

- The input will consist of an arbitrary number of fields. 

- The first line of each field contains two integers n and m (0 < n,m <= 100) which stands for the number of lines and 
columns of the field respectively. 

- The next n lines contains exactly m characters and represent the field. 

- Each safe square is represented by an “.” character (without the quotes) and each mine square is represented 
by an “*” character (also without the quotes). 

- The first field line where n = m = 0 represents the end of input and should not be processed.

#### Output

Your program should produce output as follows:

For each field, you must print the following message in a line alone:

Field #x:

Where x stands for the number of the field (starting from 1). 

The next n lines should contain the field with the “.” characters replaced by the number of adjacent mines to that square. 
There must be an empty line between field outputs.

### Clues

As you may have already noticed, each square may have at most 8 adjacent squares.

### Suggested Test Cases

This is the acceptance test input:
```bash
4 4
*...
....
.*..
....
3 5
**...
.....
.*...
0 0
```
and output:
```bash
Field #1:
*100
2210
1*10
1110

Field #2:
**100
33200
1*100
```

## The solution

The solution has been written doing TDD, check git logs.

### Developed and tested environment
```bash
elixir -v
Erlang/OTP 20 [erts-9.0.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Elixir 1.5.1

```
### Running the tests
```bash
mix test
```

### Compiling and running

// TODO

#### Approach

There is one single entry point for the application, it has the functionality of facade and it orchestrate the
for different parts of the implementation:

1. parse the input
2. create & validate the grid
3. generate grid with the hints (the algorithm)
4. generate the expected output


Entry point (Minesweeper.ex)

```bash

```

##### 1. Parsing the input from file (XXXX.ex):

```bash
4 4
*...
....
.*..
....
```

##### 2. Create a grid :

```bash
  0 1 2 3
---------
0|* . . .
1|. . . . 
2|. * . .
3|. . . .
```
Where:
- '*' is a mine (:mine)
- '.' is a safe square (:safe)


##### 3. Generate grid with the hints, the main algorithm  (Minesweeper.Grid.ex)

```bash
  0 1 2 3 x
---------
0|* 1 0 0 
1|2 2 1 0  
2|1 * 1 0 
3|1 1 1 0 
y
```

The algorithm is simple, recursive and tail call optimized:

- Given a grid and a current position in the grid
- Sum all mines of your adjacent squares
- Generate a new grid with the hint in that position
- Call recursively same method with the next position in ghe grid to evaluate


##### 4. Generate the output

### Assumptions

The solution takes some assumptions and the code reflect them:

- The file has a valid format, so there is no code checking the correctness of the grid

### Out of scope / to improve

- Input file validation
- Error handling
- File input parser could be improved, at least make it tail call optimized
- Add documentation