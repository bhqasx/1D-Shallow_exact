function [D,U]=SamRig(s)
%to sample the solution for the case in which the right state is dry

global dl ul cl dr ur;
global g;

shl=ul-cl;    %speed of left rarefaction head

if s<=shl 
    %sampling point lies to the left of the rarefaction

else

end