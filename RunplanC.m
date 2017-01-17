function [] = RunplanC(max,r,t)
%RUNPLANC Summary of this function goes here
%   Detailed explanation goes here

global deltaM1;
if max>=1
        h1 = waitbar(0,'Please wait...');
  
        
         for mm=1:max
           count=planC(r,t);
           
           strcount=['总共有',num2str(count),'个点改变了'];
           strdelta=['目前还相差',num2str(deltaM1)];
           disp(strdelta);disp(strcount); 
           
           PerStr=fix(100*mm/max); %fix是向0靠拢取整函数
           str=['随机全扫轮次',num2str(PerStr),'%']; 
           waitbar(mm/max,h1,str);
         end


        close(h1);
end
end

