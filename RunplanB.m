function [] = RunplanB(max,r,t)
%RUNPLANB Summary of this function goes here
%   Detailed explanation goes here
if max>=1
hwait=waitbar(0,'start>>>>>>>>');
for m=1:max
    
        count = planB(r,t);
        PerStr=fix(100*m/max); %fix����0��£ȡ������
        str=['����������',num2str(PerStr),'%']; 
        waitbar(m/max,hwait,str);
        
 end
close(hwait);
end
end

