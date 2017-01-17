function [ count ] = planD( input_args )
%PLAND Summary of this function goes here
%   Detailed explanation goes here
tic;
      count=0;

        for i=1:lxx
            x=modrandx(i);
            for j=1:lyy   
                y=modrandy(j);
                MARK=caculation(x,y);               
                if MARK==1
                   count=count+1;
                end

            end
        end




        strdelta=['目前还相差',num2str(deltaM1)];
        strcount=['总共有',num2str(count),'个点改变了'];
        disp(strdelta);disp(strcount);
       
toc;
end

