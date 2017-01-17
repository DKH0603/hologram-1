function [] = main()
%MAIN Summary of this function goes here
%   Detailed explanation goes here

global Sum deltaM1 INMatrix Norm_AIM ;
global Z HOUTy HINx HOUTx HINy INx INy OUTx OUTy halfx halfy;
global z0 a0;
global xu_x xu_y ;
global MZ

HINx = INx/2;       % (*入射面的横(像素)*)(*请设置成偶数*)
HINy = INy/2;       % (*入射面的纵(像素)*)(*请设置成偶数*)
HOUTx = OUTx/2;    % (*出射面的横(像素)*)(*请设置成偶数*)
HOUTy = OUTy/2;    % (*出射面的纵(像素)*)(*请设置成偶数*)
z0 = 353;                     % (*计算机中的代数距离*)
a0 = 0.3;                     % (*每个小格子半边长*)
halfx = HOUTx + HINx;         %(*理论上需要保证的x方向半径*)
halfy = HOUTy + HINy;         %(*理论上需要保证的x方向半径*)
name=['Z_',num2str(INx),'_',num2str(INy),'_',num2str(OUTx),'_',num2str(OUTy),'_',num2str(a0),'_',num2str(z0),'.mat'];
loadZ(name);
load(name);

MZ=cell(INx,INy);
for i=1:INx   
    for j=1:INy     
       MZ{i,j}=ChooseM(i,j);  
    end
end

MSum=abs(Sum).^2;
Norm_Sum=Norm(MSum);
deltaM1 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
xu_x=[1:INx];
xu_y=[1:INy];
%数据初始化
% ------------------------------数据初始化结束------------------------------------- %
%t means 1/T
RunplanA(2,0);%RunplanA(循环次数,1/T);
RunplanB(2,1,0);%RunplanB(循环次数,搜索半径,1/T);
RunplanC(2,3,0);%RunplanB(循环次数,搜索间隔,1/T);
% ------------------------------------运算结束--------------------------------------- %

MSum=abs(Sum).^2;
Norm_Sum=Norm(MSum);
figure(2);
imagesc(MSum)

end

