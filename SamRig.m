function [D,U]=SamRig(s)
%to sample the solution for the case in which the right state is dry

global dl ul cl dr ur;
global g;

shl=ul-cl;    %speed of left rarefaction head

if s<=shl 
    %sampling point lies to the left of the rarefaction
    D=dl;
    U=ul;
else
    stl=ul+2*cl;
    if s<=stl
        %sampling point lies inside the rarefaction
        U=(ul+2*cl+2*s)/3;
        C=(ul+2*cl-s)/3;
        D=C*C/g;
    else
        %sample point lies in right dry-bed state
        D=dr;
        U=ur;
    end
end