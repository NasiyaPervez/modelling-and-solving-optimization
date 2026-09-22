#Model for part 1 and part 2 of the knapsack exercise problem 5.4

set ITEMS;     
set KNAPSACKS; #important for part 2)

param weight {ITEMS} >= 0;
param value {ITEMS} >= 0;
param limit {KNAPSACKS} >=0;

var x {ITEMS, KNAPSACKS} binary;  # 1 = pack object i into knapsack k;

maximize Total_Value: sum {i in ITEMS, k in KNAPSACKS} value[i]*x[i,k];

subject to Limit {k in KNAPSACKS}: sum {i in ITEMS} weight[i]*x[i,k] <= limit[k]; # knapsack constraint for each knapsack

#For part 2:
#subject to NoDuplicates {i in ITEMS}: sum {k in KNAPSACKS} x[i,k] <= 1;    # part 2: every item can only be packed once 
