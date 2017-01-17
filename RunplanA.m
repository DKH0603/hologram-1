function [] = RunplanA(max,t)
global deltaM1;
%RUNPLANA Summary of this function goes here
%   Detailed explanation goes here
if max>=1
hwait=waitbar(0,'start>>>>>>>>');
for m=1:max
     count  =  planA(t);
     PerStr=fix(100*m/max); %fix是向0靠拢取整函数
     str=['全体扫描轮次',num2str(PerStr),'%']; 
     waitbar(m/max,hwait,str);
     
     strcount=['总共有',num2str(count),'个点改变了'];
     strdelta=['目前还相差',num2str(deltaM1)];
     disp(strdelta);disp(strcount); 
end
close(hwait);
end
end
