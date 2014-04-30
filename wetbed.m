function wetbed
%solve the Riemann problem exactly for the wet-bed case

global nIter TOL nCells ChalLen;
global dl dr ul ur;
global cl cr;
global g;
global gate;         %position of the gate
global TimeOut;
global D U;      %depth and velocity in the result
global xpos;

depth0=starte;        %get start value of depth in star region
ds=depth0;


%-------start iteration-------
for i=1:1:nIter
    [FL,FLD]=GEOFUN(ds,dl,cl);
    [FR,FRD]=GEOFUN(ds,dr,cr);
    ds=ds-(FL+FR+ur-ul)/(FLD+FRD);
    cha=abs(ds-depth0)/(0.5*(ds+depth0));         %convergence criteria
    if cha<=TOL
        break;
    end
    
    if ds<0
        ds=TOL;
    end
    
    depth0=ds;
end

if i>=nIter
    disp('number of iterations exceeded, STOP');
    pause;
end

%------compute velocity US in star region------
us=0.5*(ul+ur)+0.5*(FR-FL);
cs=(g*ds)^0.5;
%----------evaluate exact solution at time TimeOut-----------
for i=1:nCells
    xpos(i)=i*ChalLen/nCells;
    xcoord=xpos(i)-gate;
    s=xcoord/TimeOut;
    [D(i),U(i)]=SamWet(s,ds,us,cs);
end

