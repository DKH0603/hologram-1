% ˼·�������ģ�ֱ�����д���ٶ�̫���������뵽������С�ģ�Ȼ��Ŵ�ԭͼ��Ȼ���ٽ�������

global Sum deltaM1 INMatrix Norm_AIM ;
global Z HOUTy HINx HOUTx HINy INx INy OUTx OUTy halfx halfy;
global z0 a0;
global xu_x xu_y ;
global MZ

INx = 100;HINx = INx/2;       % (*������ĺ�(����)*)(*�����ó�ż��*)
INy = 100;HINy = INy/2;       % (*���������(����)*)(*�����ó�ż��*)
OUTx = 100;HOUTx = OUTx/2;    % (*������ĺ�(����)*)(*�����ó�ż��*)
OUTy = 100;HOUTy = OUTy/2;    % (*���������(����)*)(*�����ó�ż��*)
z0 = 353;                     % (*������еĴ�������*)
a0 = 0.3;                     % (*ÿ��С���Ӱ�߳�*)
halfx = HOUTx + HINx;         %(*��������Ҫ��֤��x����뾶*)
halfy = HOUTy + HINy;         %(*��������Ҫ��֤��x����뾶*)

name=['Z_',num2str(INx),'_',num2str(INy),'_',num2str(OUTx),'_',num2str(OUTy),'_',num2str(a0),'_',num2str(z0),'.mat'];

loadZ(name);
load(name);
figure(1);
AIM=loadpic('A.bmp');


% ------------------------------���ݳ�ʼ����ʼ------------------------------------- %

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
begin(0);%0��ζ�Ų����У�1��Ϊ�ſ�������
MSum=abs(Sum).^2;
Norm_Sum=Norm(MSum);
deltaM1 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
xu_x=[1:INx+1];
xu_y=[1:INy+1];
%���ݳ�ʼ��

% ------------------------------���ݳ�ʼ������------------------------------------- %

%t means 1/T

RunplanA(2,0);%RunplanA(ѭ������,1/T);
RunplanB(2,1,0);%RunplanB(ѭ������,�����뾶,1/T);
RunplanC(2,3,0);%RunplanB(ѭ������,�������,1/T);



% ------------------------------------�������--------------------------------------- %

MSum=abs(Sum).^2;
Norm_Sum=Norm(MSum);
figure(2);
imagesc(MSum)