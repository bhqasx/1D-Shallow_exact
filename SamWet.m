function [D,U]=SamWet(s,ds,us,cs)
%to sample solution through wave structure at TimeOut for wet-bed case


global dl dr ul ur;
global cl cr;
global g;

if s<=us
    %---------------------sample left wave------------------------
    if ds>=dl
        %-----------left shock----------
        ql=((ds+dl)*ds/(2*dl*dl))^0.5;
        sl=ul-cl*ql;           %shock position
        if s<=sl
            D=dl;
            U=ul;
        else
            D=ds;
            U=us;
        end
    else
        %-----------left rarefaction----------
        shl=ul-cl;            %position of the rarefaction head
        if s<=shl
            %sample point lies to the left of the rarefaction
            D=dl;
            U=ul;
        else
            stl=us-cs;      %position of the rarafaction tail
            if s<=stl
                %sample point lies inside the rarafaction
                U=(ul+2*cl+2*s)/3;
                C=(ul+2*cl-s)/3;
                D=C*C/g;
            else
                %sample point lies in the star region
                D=ds;
                U=us;
            end
        end
    end
else
    %---------------------sample right wave------------------------
    if ds>dr
        %-----------right shock----------
        qr=((ds+dr)*ds/(2*dr*dr))^0.5;
        sr=ur+cr*qr;
        if (s>sr)
            D=dr;
            U=ur;
        else
            D=ds;
            U=us;
        end
    else
        %-----------right rarefaction----------
        shr=ur+cr;
        if s>=shr
            %sample point lies to the right of the rarefaction
            D=dr;
            U=ur;
        else
            str=us+cs;
            if s>=str
                %sample point lies inside the rarefaction
                U=(ur-2*cr+2*s)/3;
                C=(-ur+2*cr+s)/3;
                D=C*C/g;
            else
                %sample point lies in the star region
                D=ds;
                U=us;
            end
        end
    end
end
            