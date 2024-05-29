%reference: Shock-Capturing Methods for Free-Shallow Flows, p128

clear;
clear global;

global g;
global dl dr ul ur;
global cl cr;
global nIter TOL nCells ChalLen;
global gate;         %position of the gate
global TimeOut;
global D U;      %depth and velocity in the result
global xpos;      %x coordinate

g=9.81;

load IniD IniD;             %load initial data and parameters
%----------------parse initial data----------------
dl=IniD.dl;                              %water depth on the left
dr=IniD.dr;
ul=IniD.ul;
ur=IniD.ur;
nIter=IniD.nIter;
TOL=IniD.TOL;
nCells=IniD.nCells;
ChalLen=IniD.ChalLen;
gate=IniD.gate;
TimeOut=IniD.TimeOut;
TimeOutFinal=TimeOut;

D=zeros(1,nCells);
U=zeros(1,nCells);
xpos=zeros(1,nCells);
%---------compute celerity on left and right states--------
cl=(g*dl)^0.5;
cr=(g*dr)^0.5;

%---------check the depth positivity condition---------
dCrit=(ur-ul)-2*(cl+cr);

for ii=1:1:50
    TimeOut=ii*TimeOutFinal/50;

    if (dl<=0||dr<=0||dCrit>=0)      %dry bed cases
        drybed;
    else
        wetbed;
    end

    %-------------------------------plot---------------------------------------
    subplot(2,1,1);
    plot(xpos,D,'bo-');
    axis([-inf,inf,0,inf]);            %adjust the axis
    title('Depth');

    subplot(2,1,2);
    plot(xpos,U,'bo-');
    title('Velocity');
    
    drawnow;  % force MATLAB to update the figure
    pause(0.1);  % pause for 0.1 seconds to slow down the update speed
end
    
