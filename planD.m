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




        strdelta=['Ŀǰ�����',num2str(deltaM1)];
        strcount=['�ܹ���',num2str(count),'����ı���'];
        disp(strdelta);disp(strcount);
       
toc;
end

