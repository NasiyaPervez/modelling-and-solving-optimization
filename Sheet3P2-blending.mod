# Problem 3.2: This is a basic model for the gasoline blending example from the lecture.

# Define the variables and set the non-negativity constraints in one step:
# produced amount of gasoline A,B,C
var yA >= 0; 
var yB >= 0;
var yC >= 0;
# amount of basic product 1 used for gasoline A,B,C:
var x1A >= 0; 
var x1B >= 0;
var x1C >= 0;
# amount of basic product 2 used for gasoline A,B,C:
var x2A >= 0;
var x2B >= 0;
var x2C >= 0;
# amount of basic product 3 used for gasoline A,B,C:
var x3A >= 0;
var x3B >= 0;
var x3C >= 0;
# amount of basic product 4 used for gasoline A,B,C:
var x4A >= 0;
var x4B >= 0;
var x4C >= 0;

# objective function: revenue from selling yA, yB, yC minus cost for basic products
maximize profit: 5.5*yA+4.5*yB+3.5*yC-3*(x1A+x1B+x1C)-6*(x2A+x2B+x2C)-4*(x3A+x3B+x3C)-5*(x4A+x4B+x4C);

# Warehouse availability of the 4 basic products
subject to warehouse1: x1A+x1B+x1C <= 3000;
subject to warehouse2: x2A+x2B+x2C <= 2000;
subject to warehouse3: x3A+x3B+x3C <= 4000;
subject to warehouse4: x4A+x4B+x4C <= 1000;

# blending rules for gasoline A:
subject to blendingrule1: x1A <= 0.3*yA;
subject to blendingrule2: x2A >= 0.4*yA;
subject to blendingrule3: x3A <= 0.5*yA;

# blending rules for gasoline B:
subject to blendingrule4: x1B <= 0.5*yB;
subject to blendingrule5: x2B >= 0.1*yB;

# blending rules for gasoline C:
subject to blendingrule6: x1C >= 0.7*yC;

# connecting the variables:
subject to gasA: yA = x1A+x2A+x3A+x4A;
subject to gasB: yB = x1B+x2B+x3B+x4B;
subject to gasC: yC = x1C+x2C+x3C+x4C;

# Observe that - even for this tiny model- defining all the variables manually is cumbersome and prone to errors.
# Therefore, we will improve the model by writing the data in a separate file and define sets of variables.