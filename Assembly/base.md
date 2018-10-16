# bus 

- address buses
cpu use address bus to inform memory about which element to read or write.

if have n address lines, then cpu can find 2^n memory cells.

- data buses
cpu use data bus to move data from memory to register in a read operation and from register to memory in a write operation.

if have n data lines, then cpu can move up to n(bit) data at a time.

- control buses
cpu use control bus to achieve for control purposes, for example, one line is used to inform the memory about whether to do read operation or the write operation.

# bit unit

```
b : 8 bit
w : 16 bit (word)
l : 32 bit 
q : 64 bit
```
these bit units can be used in assembly commands, like `movl`.

