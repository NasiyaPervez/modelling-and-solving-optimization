# Problem 1.4:
# The data given defines three equations in three variables.
# We don't need additional data here.
# The problem is modelled as a system of linear equations.

var p1>=0;
var p2>=0;
var p3>=0;

maximize func: p1; #The function is identially zero, f=0.

s.t. constraint1: p1 + p2 + p3 = 1200;
s.t. constraint2: p1 = 2*p2; #p1-2*p2=0
s.t. constraint3: p2 = p3; #p2-p3=0