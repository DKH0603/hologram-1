INx = 100;HINx = INx/2;       % (*入射面的横(像素)*)(*请设置成偶数*)
INy = 100;HINy = INy/2;       % (*入射面的纵(像素)*)(*请设置成偶数*)
OUTx = 100;HOUTx = OUTx/2;    % (*出射面的横(像素)*)(*请设置成偶数*)
OUTy = 100;HOUTy = OUTy/2;    % (*出射面的纵(像素)*)(*请设置成偶数*)
z0 = 353;                     % (*计算机中的代数距离*)
a0 = 0.3;                     % (*每个小格子半边长*)
halfx = HOUTx + HINx;         %(*理论上需要保证的x方向半径*)
halfy = HOUTy + HINy;         %(*理论上需要保证的x方向半径*)
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



hwait=waitbar(0,'请等待>>>>>>>>');

for i=1:al   
    
         x=a(i);y=b(i);
         Sum=Sum+ChooseM(Z,x,y,HINx,HOUTx,HINy,HOUTy);
        
         k=i/(al); 
         PerStr=fix(100*k); %fix是向0靠拢取整函数
         str=['正在运行中',num2str(PerStr),'%']; 
         waitbar(k,hwait,str);

end
close(hwait);
toc;

MSum=abs(Sum).^2;
Norm_Sum=Norm(MSum);


deltaM = sum(sum(abs(Norm_Sum-Norm_AIM)));


