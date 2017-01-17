function [] = fanfan2(tt,ttt)
%FANFAN2 Summary of this function goes here
%   Detailed explanation goes here

global  deltaM1 INMatrix;
global  INx INy

% INMatrix=ones(INx,INy);
% tempSum=mycon(INMatrix);MSum=abs(tempSum).^2;Norm_Sum=Norm(MSum);
% deltaM1 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
    h1=waitbar(0,'start>>>>>>>>');
    h2=waitbar(0,'start>>>>>>>>');
    h3=waitbar(0,'start>>>>>>>>');
 for k=1:tt
    
        L=round(3/100*INx*(5/3-k/tt));
        randomM=zeros(INx,INy);
        pointx=L+floor((INx-2*L)*rand())+1;
        pointy=L+floor((INy-2*L)*rand())+1;
        t=floor(L*L);
        disp('L=');disp(L);
        tic;
 for i=pointx-L:pointx+L
       for j=pointy-L:pointy+L  
        caculation(i,j,ttt);
        PerStr=fix(100*(j-pointy+L)/(2*L+1)); %fix是向0靠拢取整函数
        str=['进度条',num2str(PerStr),'%']; 
        waitbar((j-pointy+L)/(2*L+1),h1,str);
       end
        PerStr=fix(100*(i-pointy+L)/(2*L+1)); %fix是向0靠拢取整函数
        str=['进度条',num2str(PerStr),'%']; 
        waitbar((i-pointy+L)/(2*L+1),h2,str);
 end
       toc;

      PerStr=round(100*k/tt,1); %fix是向0靠拢取整函数
      str=['进度条',num2str(PerStr),'%']; 
       waitbar(k/tt,h3,str);
%     end
% end

 end
            close(h1);close(h2);close(h3);
end

