function [] = RunplanC(max,r,t)
%RUNPLANC Summary of this function goes here
%   Detailed explanation goes here

global deltaM1;
if max>=1
        h1 = waitbar(0,'Please wait...');
  
        
         for mm=1:max
           count=planC(r,t);
           
           strcount=['�ܹ���',num2str(count),'����ı���'];
           strdelta=['Ŀǰ�����',num2str(deltaM1)];
           disp(strdelta);disp(strcount); 
           
           PerStr=fix(100*mm/max); %fix����0��£ȡ������
           str=['���ȫɨ�ִ�',num2str(PerStr),'%']; 
           waitbar(mm/max,h1,str);
         end


        close(h1);
end
end

