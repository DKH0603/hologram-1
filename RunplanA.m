function [] = RunplanA(max,t)
global deltaM1;
%RUNPLANA Summary of this function goes here
%   Detailed explanation goes here
if max>=1
hwait=waitbar(0,'start>>>>>>>>');
for m=1:max
     count  =  planA(t);
     PerStr=fix(100*m/max); %fix����0��£ȡ������
     str=['ȫ��ɨ���ִ�',num2str(PerStr),'%']; 
     waitbar(m/max,hwait,str);
     
     strcount=['�ܹ���',num2str(count),'����ı���'];
     strdelta=['Ŀǰ�����',num2str(deltaM1)];
     disp(strdelta);disp(strcount); 
end
close(hwait);
end
end
