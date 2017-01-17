function [] = newmethod(t,tt)
%NEWMETHOD Summary of this function goes here
%   Detailed explanation goes here
global  deltaM1 INMatrix;
global  Norm_AIM
global  INx INy

% for i=1:t
% T=i/(2*t+1)+0.8;
% temp=sign(INMatrix+(rand(INx,INy)>T));
temp=ones(INx,INy);
tempSum=mycon(temp);MSum=abs(tempSum).^2;Norm_Sum=Norm(MSum);
deltaM1 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));

% tempSum=mycon(temp);MSum=abs(tempSum).^2;Norm_Sum=Norm(MSum);
% deltaM2 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
% delta=deltaM2/deltaM1;
% 
% if  delta<1
%     INMatrix=temp;
%     deltaM1=deltaM2;
%     disp(deltaM1);
%     disp('进入内层');

    hwait=waitbar(0,'start>>>>>>>>');
    for j=1:tt
        TT=INx*(1-j/tt)+2;
        temp=randomchange(INMatrix,TT);
        tempSum=mycon(temp);MSum=abs(tempSum).^2;Norm_Sum=Norm(MSum);
        deltaM2 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
        delta=deltaM2/deltaM1;

        if  delta<1
            INMatrix=temp;
            deltaM1=deltaM2;
            disp(deltaM1);
            disp('更好了');
        end 
      PerStr=fix(100*j/tt); %fix是向0靠拢取整函数
     str=['静读条',num2str(PerStr),'%']; 
     waitbar(j/tt,hwait,str);
%     end
% end

    end
close(hwait);
            disp(deltaM1);
            imshow(INMatrix)
end

