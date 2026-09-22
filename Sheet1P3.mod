#Problem 1.3:

var x1 >= 0; #define the two variables
var x2 >= 0;

maximize objfunc: 40*x1 + 60*x2;

subject to constr1: 3*x1 + 6*x2 <= 150;
subject to constr2: 2*x1 + 1*x2 <= 40;

# Alternative for non-negativity constraints:
#subject to nonneg1: 0 <= x1; #Non-negativity NOT by default
#subject to nonneg2: 0 <= x2;  

#The commands below can either by typed to the console or can be 
#put directly into the file (uncomment below)

#option solver highs;
#solve;
#display x1,x2;