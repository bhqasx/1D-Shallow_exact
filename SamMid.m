function [D,U]=SamMid(s)
%to sample the solution for the case in which the middle state is dry

global dl dr ul ur;
global cl cr;
global g;

%compute wave speeds
shl=ul-cl;
ssl=ul+2*cl;
ssr=ur-2*cr;
shr=ur+cr;

if s<=shl
    %sampling point lies to the left of the left rarefaction
    D=dl;
    U=ul;
end

if (s>shl)&&(s<=ssl)
    %sampling point lies inside the left rarefaction
    U=(ul+2*cl+2*s)/3;
    C=(ul+2*cl-s)/3;
    D=C*C/g;
end

if (s>ssl)&&(s<=ssr)
    %sampling point lies inside the middle dry bed regions
    D=0;
    U=0;
end

if (s>ssr)&&(s<=shr)
    %sampling point lies inside the right rarefaction
    U=(ur-2*cr+2*s)/3;
    C=(-ur+2*cr+s)/3;
    D=C*C/g;
end

if s>shr
    %sampling point lies to the right of the right rarefaction
    D=dr;
    U=ur;
end
