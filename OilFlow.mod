set NODES; #All oil fields, refineries, and distr. centers
set SOURCESINK; #the source and sink of a flow network
set ARCS within {NODES, NODES}; #only existing arcs are defined in the data file

param capac {ARCS} default Infinity; #capacity of arc(i,j)

var x {ARCS} >= 0; #flow on arc (i,j)

maximize F: sum{(s,j) in ARCS: s in SOURCESINK} x[s,j]; #Find the maximal flow. Only the flow from the sink is added with the term x[s,j].

#Define the constraints F.1 and F.2 from the lecture:
subject to flow_conserve {i in NODES diff SOURCESINK}: sum{j in NODES: (i,j) in ARCS} x[i,j] - sum{j in NODES: (j,i) in ARCS} x[j,i] = 0;
subject to capacity {(i,j) in ARCS}: x[i,j] <= capac[i,j];
