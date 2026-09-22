#Define the variables, name them simply after the arcs:
var sa >= 0;
var sc >= 0;
var ab >= 0;
var ad >= 0;
var ac >= 0;
var cd >= 0;
var bt >= 0;
var bd >= 0;
var dt >= 0;

#Find a maximal Flow:
maximize FlowValue: sa + sc;

#(F.1) constaints: arc capacities (non-negativity already in the variable definition)
subject to Capacity_sa: sa <= 3;
subject to Capacity_sc: sc <= 5;
subject to Capacity_ac: ac <= 1;
subject to Capacity_ab: ab <= 4;
subject to Capacity_bd: bd <= 3;
subject to Capacity_ad: ad <= 2;
subject to Capacity_cd: cd <= 2;
subject to Capacity_bt: bt <= 2;
subject to Capacity_dt: dt <= 4;

#(F.2) constaints: flow conservation
subject to FlowConservation_a: sa - ab - ad - ac = 0;
subject to FlowConservation_b: ab -bt- bd = 0;
subject to FlowConservation_c: ac + sc - cd = 0;
subject to FlowConservation_d: cd + ad + bd - dt = 0;
