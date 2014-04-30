function drybed
%to compute the exact solution in the case in which a portion of dry bed is
%present

global nCells;
global xpos;      %x coordinate
global gate;         %position of the gate
global TimeOut ChalLen;
global dl dr;
global D U;      %depth and velocity in the result

for i=1:1:nCells
    xpos(i)=i*ChalLen/nCells;
    xcoord=xpos(i)-gate;
    s=xcoord/TimeOut;

    if dl<=0
        %left state is dry
        [D(i),U(i)]=SamLef(s);
    else
        if dr<=0
            %right state is dry
            [D(i),U(i)]=SamRig(s);
        else
            %middle state is dry
            [D(i),U(i)]=SamMid(s);
        end
    end
end
