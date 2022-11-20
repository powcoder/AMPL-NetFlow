#AMPL - Distribution Network Flow Model - Example 10.1

#SETS
set N; #Set of Nodes
set A within (N cross N); #Set of Arcs (cross product of sets of nodes)

#PARAMETERS
param cost{A} >= 0; # Cost associated with each arc
param capacity{A} >=0; # Cpacity associated with each arc
param demand {N}; # (+)Demand or (-)Supply

#NETWORK DEFINITION
node Location {n in N}: net_in = demand[n];
arc Ship {(i,j) in A} >= 0, <= capacity[i,j],
from Location[i], to Location[j];


#OBJECTIVE FUNCTION
minimize Total_Cost: sum{(i,j) in A} (cost[i,j])*(Ship[i,j]);