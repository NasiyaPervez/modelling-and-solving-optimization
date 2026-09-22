# Solve the dual problem in Exercise 3.1:
var y1 >= 0;
var y2 >= 0;
var y3 >= 0;

minimize dobj: 150*y1 + 22*y2 + 27.5*y3;
subject to constraint1: 3*y1 +y2 +y3 >=20;
subject to constraint2: 6*y1 +0.5*y2 + y3 >= 30;