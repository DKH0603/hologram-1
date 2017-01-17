function [] = main()
%MAIN Summary of this function goes here
%   Detailed explanation goes here

global Sum deltaM1 INMatrix Norm_AIM ;
global Z HOUTy HINx HOUTx HINy INx INy OUTx OUTy halfx halfy;
global z0 a0;
global xu_x xu_y ;
global MZ

HINx = INx/2;       % (*������ĺ�(����)*)(*�����ó�ż��*)
HINy = INy/2;       % (*���������(����)*)(*�����ó�ż��*)
HOUTx = OUTx/2;    % (*������ĺ�(����)*)(*�����ó�ż��*)
HOUTy = OUTy/2;    % (*���������(����)*)(*�����ó�ż��*)
z0 = 353;                     % (*������еĴ�������*)
a0 = 0.3;                     % (*ÿ��С���Ӱ�߳�*)
halfx = HOUTx + HINx;         %(*��������Ҫ��֤��x����뾶*)
halfy = HOUTy + HINy;         %(*��������Ҫ��֤��x����뾶*)
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

end

