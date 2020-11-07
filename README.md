# uberswap
A match 3 variant for the Commodore 64. The goal is to remove all colored pieces from the playing field by swapping them. If a swap creates one or two figures with more then two pieces of the same colour, these figures will be removed. The game ends when all the pieces have been removed or when you give up by pressing 'x'. You'll obtain one of two bombs when you clear an entire column that's not the rightmost. You can activate a bomb by pressing 'b', which will clear the entire row.

The game is written in BASIC with some assembler on top. It will run in the interpreter, but very slowly. The build script in build compiles it using the MOSpeed BASIC compiler https://github.com/EgonOlsen71/basicv2

It generates two output files (which can be found in the build directory as well), called uberswap.prg and uberswap-c.prg. They are both functional identical, but the -c variant has been compressed after compilation.
