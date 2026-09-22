option solver gurobi;

#The set V of vertices/cities. We define it as ordered set, so that that the names are mapped to the set {1,...,n}:
set V ordered;

# Get the number of the cities:
param n := card {V};

#Index set for the power set. The power set has 2**n elements:
set VV := 0 .. (2**n - 1); 

#Build the power set needed for the constraints.
#POW[k] is the k-th distinct subset of V.
set POW {k in VV} := {i in V: (k div 2**(ord(i)-1)) mod 2 = 1};  

#Since the weights are symmetric, we define the edges (=LINKS) only for half of the combinations.
#We use "ord(i)" to access the index of a vertex:
set LINKS := {i in V, j in V: ord(i) < ord(j)}; 

#The edge cost:
param cost {LINKS} >= 0;

#One decision variable per edge:
var X {LINKS} binary;