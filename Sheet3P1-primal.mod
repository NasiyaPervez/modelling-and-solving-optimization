#Primal model from Exercise 3.1:
var x1 >=0;
var x2 >=0;

maximize obj: 20*x1 + 30*x2;
subject to constraint1: 3*x1 + 6*x2 <=150;
subject to constraint2: x1 + 0.5*x2 <=22;
subject to constraint3: x1 + x2     <=27.5;