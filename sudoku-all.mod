####################################################
#Sudoku model:
####################################################
param m >= 1, integer, default 3;
param n := m*m;
set N := 1..n;

# prespecified data values
param P{N,N} default 0, integer, >= 0, <= n;

# z[i,j,k] = 1 if digit k is in row i and column j
var z{N,N,N} binary;

# dummy objective
minimize obj: 0;

# only one of each digit in each column
subject to col_sum{j in N, k in N}: 
     sum{i in N} z[i,j,k] = 1;

# only one of each digit in each row
subject to row_sum{i in N, k in N}: 
     sum{j in N} z[i,j,k] = 1;

# only one of each digit in each box
subject to sqr_sum{r in 0..m-1, c in 0..m-1, k in N}:
   sum{p in 1..m, q in 1..m} z[m*r+p,m*c+q,k] = 1;

# only one digit in each cell
subject to unique{i in N, j in N}: sum{k in N} z[i,j,k] = 1;

# fix position of prespecified values
subject to fixed{i in N, j in N: P[i,j] <> 0}:
      z[i,j,P[i,j]] = 1;

###################################################
# Data file:
###################################################
data;
param m:= 3;
param P:  1  2  3  4  5  6  7  8  9 :=
1         .  .  .  4  .  5  .  1  .
2         7  .  .  9  .  3  .  5  .
3         3  .  9  .  8  .  .  6  4

4         .  9  .  .  3  .  .  .  6
5         4  .  7  .  2  .  .  .  9
6         .  .  6  .  .  4  1  8  .

7         2  .  .  8  .  .  .  .  1
8         .  .  .  .  1  .  .  .  .
9         8  7  .  .  .  .  3  .  . ;

solve;

###################################################
# Display the results:
###################################################
for {i in N}{
   for {j in N}{
      for {k in N}{
         if (z[i,j,k] == 1) then printf "%3i", k;
      };
      if ((j mod m) == 0) then printf " |";
   };
   printf "\n";
   if ((i mod m) == 0) then {
      for {j in 1..m}{
         for {k in 1..m-1}{ printf "---" };
         if (j < m) then
            printf "----+";
         else
            printf "----+\n";
      };
   };
};