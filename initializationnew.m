global Sum deltaM1 INMatrix Norm_AIM ;
global  HOUTy HINx HOUTx HINy INx INy OUTx OUTy halfx halfy;
global z0 a0;
global xu_x xu_y ;
global AIM;
global Norm_Sum 
global field
% AIM=imread('ZJUlogo.bmp');figure(1);imagesc(AIM);
% small_AIM = scale(AIM,70,100);

[INx,INy]=size(AIM);

% OUTx = INx;OUTy = INy;%原则上可以要求任意的输入面大小和输出面大小，这里设置成两者相同

% AIM=small_AIM;
Norm_AIM=Norm(AIM);
% INMatrix=AIM; % INMatrix=rand(INx,INy)>0.8;% INMatrix=zeros(INx + 1,INy + 1);% INMatrix=ones(INx + 1,INy + 1);
INMatrix=rand(INx,INy)>0.9;


% main()

%--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

HINx = INx/2;       % (*入射面的横(像素)*)(*请设置成偶数*)
HINy = INy/2;       % (*入射面的纵(像素)*)(*请设置成偶数*)
HOUTx = OUTx/2;    % (*出射面的横(像素)*)(*请设置成偶数*)
HOUTy = OUTy/2;    % (*出射面的纵(像素)*)(*请设置成偶数*)
z0 = 353;                     % (*计算机中的代数距离*)
a0 = 0.3;                     % (*每个小格子半边长*)
name=['field_',num2str(INx),'_',num2str(INy),'_',num2str(OUTx),'_',num2str(OUTy),'_',num2str(a0),'_',num2str(z0),'.mat'];
loadZ(name);
load(name);
begin(0);%0意味着不并行，1以为着开启并行
% MZ=cell(INx,INy);
% for i=1:INx   
%     for j=1:INy     
%        MZ{i,j}=ChooseM(i,j);  
%     end
% end

MSum=abs(Sum).^2;
Norm_Sum=Norm(MSum);
deltaM1 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
xu_x=[1:INx];
xu_y=[1:INy];