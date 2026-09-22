#sample graph has vertices {1,2,3,4,5} and 8 edges specified in the data file
set EDGES;
param weight{EDGES};
param nbvert; #number of vertices or 5 (but using data file)

var x{EDGES} binary;

minimize treeweight: sum{e in EDGES} weight[e]*x[e];
s.t. treesize: sum{e in EDGES} x[e] = nbvert-1; #5 vertices minus 1

#forbid circle 2-3-5:
#s.t. circle1: x[25]+x[23]+x[35] <= 2;