function d_guess=starte
%to provide starting value for Newton iteration. The Two-Rarefaction
%Riemann solver (TRRS) and Two-Shock Riemann Solver (TSRS) are used
%adaptively

global dl dr ul ur;
global cl cr;
global g;

dmin=min(dl,dr);
%--------------------use TRRS solution as staring value--------------------
d_guess=1/g*(0.5*(cl+cr)-0.25*(ur-ul))^2;
if d_guess<=dmin
    %TRRS is suitable
else
    %use TSRS solution as starting value with DS as computed from TRRS as
    %estimate
    gel=(0.5*g*(d_guess+dl)/(d_guess*dl))^0.5;
    ger=(0.5*g*(d_guess+dr)/(d_guess*dr))^0.5;
    d_guess=(gel*dl+ger*dr-(ur-ul))/(gel+ger);
end
    

