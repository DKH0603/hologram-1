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

% OUTx = INx;OUTy = INy;%ԭ���Ͽ���Ҫ��������������С��������С���������ó�������ͬ

% AIM=small_AIM;
Norm_AIM=Norm(AIM);
% INMatrix=AIM; % INMatrix=rand(INx,INy)>0.8;% INMatrix=zeros(INx + 1,INy + 1);% INMatrix=ones(INx + 1,INy + 1);
INMatrix=rand(INx,INy)>0.9;


% main()

%--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

HINx = INx/2;       % (*������ĺ�(����)*)(*�����ó�ż��*)
HINy = INy/2;       % (*���������(����)*)(*�����ó�ż��*)
HOUTx = OUTx/2;    % (*������ĺ�(����)*)(*�����ó�ż��*)
HOUTy = OUTy/2;    % (*���������(����)*)(*�����ó�ż��*)
z0 = 353;                     % (*������еĴ�������*)
a0 = 0.3;                     % (*ÿ��С���Ӱ�߳�*)
name=['field_',num2str(INx),'_',num2str(INy),'_',num2str(OUTx),'_',num2str(OUTy),'_',num2str(a0),'_',num2str(z0),'.mat'];
loadZ(name);
load(name);
begin(0);%0��ζ�Ų����У�1��Ϊ�ſ�������
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