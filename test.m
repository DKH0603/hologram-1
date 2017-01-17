INx = 100;HINx = INx/2;       % (*������ĺ�(����)*)(*�����ó�ż��*)
INy = 100;HINy = INy/2;       % (*���������(����)*)(*�����ó�ż��*)
OUTx = 100;HOUTx = OUTx/2;    % (*������ĺ�(����)*)(*�����ó�ż��*)
OUTy = 100;HOUTy = OUTy/2;    % (*���������(����)*)(*�����ó�ż��*)
z0 = 353;                     % (*������еĴ�������*)
a0 = 0.3;                     % (*ÿ��С���Ӱ�߳�*)
halfx = HOUTx + HINx;         %(*��������Ҫ��֤��x����뾶*)
halfy = HOUTy + HINy;         %(*��������Ҫ��֤��x����뾶*)
% halfx=5;halfy=10;
name=['Z_',num2str(INx),'_',num2str(INy),'_',num2str(OUTx),'_',num2str(OUTy),'_',num2str(a0),'_',num2str(z0),'.mat'];
sgc_exist = exist(name, 'file');

% Import AIM.png
% Norm_AIM=Norm(AIM);
if sgc_exist==0
    Z=[];
    for i=1:(2*halfx+1)
        for j=1:(2*halfy+1)
            Z(i,j)=Yuanchang(i-1-halfx,j-1-halfy,0,0,z0,a0);
        end
    end
    save(name,'Z');
else
    load(name);
end


INMatrix=rand(INx + 1,INy + 1)>0.5;

[a,b]=find(INMatrix);
al=length(a);

tic;
Sum=0;


%                  % parfor_progress(al); % Initialize 
% parpool();
% parfor i=1:al   
%     
%         x=a(i);y=b(i);
%         Sum=Sum+Z(halfx - HOUTx + HINx - x + 2:halfx + HOUTx + HINx - x + 2,halfy - HOUTy + HINy + 2 - y: halfy + HOUTy + HINy + 2 - y);
%                    %parfor_progress;
% 
%    
% end
%                   % parfor_progress(0); % Clean up



hwait=waitbar(0,'��ȴ�>>>>>>>>');

for i=1:al   
    
         x=a(i);y=b(i);
         Sum=Sum+ChooseM(Z,x,y,HINx,HOUTx,HINy,HOUTy);
        
         k=i/(al); 
         PerStr=fix(100*k); %fix����0��£ȡ������
         str=['����������',num2str(PerStr),'%']; 
         waitbar(k,hwait,str);

end
close(hwait);
toc;

MSum=abs(Sum).^2;
Norm_Sum=Norm(MSum);


deltaM = sum(sum(abs(Norm_Sum-Norm_AIM)));


