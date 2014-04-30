function [D,U]=SamLef(s)
%to sample the solution for the case in which the left state is dry

global dr ur cr dl ul;
global g;

shr=ur+cr;       %speed of right rarefaction head
if s>=shr
    D=dr;
    U=ur;
else
    str=ur-2*cr;         %speed of right rarefaction tail
    if s>=str
        %sampling point lies inside the rarefaction
        U=(ur-2*cr+2*s)/3;
        C=(-ur+2*cr+s)/3;
        D=C*C/g;
    else
        %sampling point lies in dry-bed state
        D=dl;
        U=ul;
    end
end
