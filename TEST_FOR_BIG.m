% 思路是这样的，直接运行大的速度太慢，于是想到先运行小的，然后放大到原图，然后再进行运算

global Sum deltaM1 INMatrix Norm_AIM ;
global Z HOUTy HINx HOUTx HINy INx INy OUTx OUTy halfx halfy;
global z0 a0;
global xu_x xu_y ;
global MZ

INx = 100;HINx = INx/2;       % (*入射面的横(像素)*)(*请设置成偶数*)
INy = 100;HINy = INy/2;       % (*入射面的纵(像素)*)(*请设置成偶数*)
OUTx = 100;HOUTx = OUTx/2;    % (*出射面的横(像素)*)(*请设置成偶数*)
OUTy = 100;HOUTy = OUTy/2;    % (*出射面的纵(像素)*)(*请设置成偶数*)
z0 = 353;                     % (*计算机中的代数距离*)
a0 = 0.3;                     % (*每个小格子半边长*)
halfx = HOUTx + HINx;         %(*理论上需要保证的x方向半径*)
halfy = HOUTy + HINy;         %(*理论上需要保证的x方向半径*)

name=['Z_',num2str(INx),'_',num2str(INy),'_',num2str(OUTx),'_',num2str(OUTy),'_',num2str(a0),'_',num2str(z0),'.mat'];

loadZ(name);
load(name);
figure(1);
AIM=loadpic('A.bmp');


% ------------------------------数据初始化开始------------------------------------- %

Norm_AIM=Norm(AIM);
MZ=cell(INx+1,INy+1);
for i=1:INx+1   
    for j=1:INy+1      
       MZ{i,j}=ChooseM(i,j);  
    end
end

% INMatrix=rand(INx + 1,INy + 1)>0.8;
% INMatrix=zeros(INx + 1,INy + 1);
% INMatrix=ones(INx + 1,INy + 1);
INMatrix=AIM;
begin(0);%0意味着不并行，1以为着开启并行
MSum=abs(Sum).^2;
Norm_Sum=Norm(MSum);
deltaM1 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
xu_x=[1:INx+1];
xu_y=[1:INy+1];
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