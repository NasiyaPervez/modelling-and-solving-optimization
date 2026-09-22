option solver highs; #use the MIP solver highs

set JOBS;  #set of jobs=N
set MACHI; #set of machines=M

param processtime {JOBS}; #each job has a processing time

var z >=0;
var x{MACHI, JOBS} binary; #x[i,j]=1 if job j is assigned to machine i

minimize makespan: z; #the next line defines z via a constraint
subject to define_makespan{i in MACHI}: z >= sum {j in JOBS} processtime[j]*x[i,j]; #if z at least the finishing time of the last machine
subject to assign_all_jobs{j in JOBS}: sum {i in MACHI} x[i,j] =1; #each job is done