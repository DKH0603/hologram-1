function [] = fanfan(tt)
%FANFAN Summary of this function goes here
%   Detailed explanation goes here

global  deltaM1 INMatrix;
global  Norm_AIM Sum Norm_Sum
global  INx INy

% INMatrix=ones(INx,INy);
% tempSum=mycon(INMatrix);MSum=abs(tempSum).^2;Norm_Sum=Norm(MSum);
% deltaM1 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
    hwait=waitbar(0,'start>>>>>>>>');
    h2=waitbar(0,'start>>>>>>>>');
 for j=1:tt
    
        L=round(1/24*INx*(3-j/tt));
        randomM=zeros(INx,INy);
        pointx=L+floor((INx-2*L)*rand())+1;
        pointy=L+floor((INy-2*L)*rand())+1;
        t=floor(L*L);
        
 for i=1:t
        T=0.2+0.8*i/t;
        randomM(pointx-L:pointx+L,pointy-L:pointy+L)=rand(2*L+1,2*L+1)>T;
        temp=mod(INMatrix + randomM ,2);
        tempSum=mycon(temp);MSum=abs(tempSum).^2;Norm_Sum=Norm(MSum);
        deltaM2 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
        delta=deltaM2/deltaM1;

        if   delta<1 
            INMatrix=temp;
            Sum=tempSum;
            deltaM1=deltaM2;
%             disp(deltaM1);
%             disp(T);
        end 
        
        PerStr=fix(100*i/t); %fix是向0靠拢取整函数
        str=['进度条',num2str(PerStr),'%']; 
        waitbar(i/t,h2,str);
 end
       

      PerStr=round(100*j/tt,1); %fix是向0靠拢取整函数
     str=['进度条',num2str(PerStr),'%']; 
     waitbar(j/tt,hwait,str);
%     end
% end

    end
close(hwait);close(h2);
            disp(deltaM1);
            imshow(INMatrix)

end

