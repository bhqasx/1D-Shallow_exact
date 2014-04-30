function [F,FD]=GEOFUN(D,dk,ck)
%to evaluate function FL, FR and their derivatives in iterative Riemann
%solver, for wet-bed case

global g;

if D<=dk
    %-------rarefaction wave-------
    C=(g*D)^0.5;
    F=2*(C-ck);
    FD=g/C;
else
    %--------shock wave-------
    ges=(0.5*g*(D+dk)/(D*dk))^0.5;
    F=(D-dk)*ges;
    FD=ges-0.25*g*(D-dk)/(ges*D*D);
end