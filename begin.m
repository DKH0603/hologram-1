function [] = begin(set)
global Sum INMatrix Z HINx HOUTx HINy HOUTy;

%BEGIN Summary of this function goes here
%   Detailed explanation goes here
[a,b]=find(INMatrix);
al=length(a);
tic;
Sum=0;


if set==0    
      hwait=waitbar(0,'��ȴ�>>>>>>>>');

        for i=1:al   

                 x=a(i);y=b(i);
                 Sum=Sum+ChooseM(x,y);

                 k=i/(al); 
                 PerStr=fix(100*k); %fix����0��£ȡ������
                 str=['����������',num2str(PerStr),'%']; 
                 waitbar(k,hwait,str);

        end
        close(hwait);
        
else
        SSum=0;
        disp('���ڲ��ò�������');
        parfor i=1:al     
           x=a(i);y=b(i);
           SSum=SSum+ChooseMM(x,y,Z,HINx,HOUTx,HINy,HOUTy);       
        end
        disp('�����������');
        Sum=SSum;
end
      toc;
end

