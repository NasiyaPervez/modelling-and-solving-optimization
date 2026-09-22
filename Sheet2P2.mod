# Problem 2.2 (Bakery Shift):

# One variable for every 8h shift
var x1 >= 0;
var x2 >= 0;
var x3 >= 0;
var x4 >= 0;
var x5 >= 0;
var x6 >= 0;

# Minimal number of employees:
minimize shiftplan: x1 + x2 + x3 + x4 + x5 + x6;

# each shift covers two 4h intervals:
subject to shift1: x1 + x2 >= 7;
subject to shift2: x2 + x3 >= 11;
subject to shift3: x3 + x4 >= 8;
subject to shift4: x4 + x5 >= 10;
subject to shift5: x5 + x6 >= 7;
subject to shift6: x6 + x1 >= 4;
