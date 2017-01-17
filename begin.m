function [] = begin(set)
global Sum INMatrix Z HINx HOUTx HINy HOUTy;

%BEGIN Summary of this function goes here
%   Detailed explanation goes here
[a,b]=find(INMatrix);
al=length(a);
tic;
Sum=0;


if set==0    
      hwait=waitbar(0,'请等待>>>>>>>>');

        for i=1:al   

                 x=a(i);y=b(i);
                 Sum=Sum+ChooseM(x,y);

                 k=i/(al); 
                 PerStr=fix(100*k); %fix是向0靠拢取整函数
                 str=['正在运行中',num2str(PerStr),'%']; 
                 waitbar(k,hwait,str);

        end
        close(hwait);
        
else
        SSum=0;
        disp('正在采用并行运算');
        parfor i=1:al     
           x=a(i);y=b(i);
           SSum=SSum+ChooseMM(x,y,Z,HINx,HOUTx,HINy,HOUTy);       
        end
        disp('并行运算结束');
        Sum=SSum;
end
      toc;
end

