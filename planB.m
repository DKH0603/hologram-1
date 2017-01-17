% function [Sum,deltaM1,INMatrix,count] = planB(Sum,deltaM1,INMatrix,Z,HINx,HOUTx,HINy,HOUTy,Norm_AIM,r)
%PLANB Summary of this function goes here
%   Detailed explanation goes here

function [count] = planB(r,t)
global Sum deltaM1 INMatrix  HOUTy Norm_AIM ;
global Z HINx HOUTx HINy INx INy ;
% global xu_x xu_y ;

tic;
count=0;

[a,b]=find(INMatrix);
al=length(a);
randxu=randperm(al);
hb = waitbar(0,'Please wait...');
for f=1:al
    
    k=randxu(f);
    
    
       x=a(k);
       if b(k)>r&&b(k)<INy-r
               for y=b(k)-r:b(k)-1;
                      MARK=caculation(x,y,t);               
                      count=count+MARK;
               end

                for y=b(k)+1:b(k)+r;
                      MARK=caculation(x,y,t);               
                      count=count+MARK;
                end
       end
       
        y=b(k);
        
        if a(k)>r&&a(k)<INx-r
            
                for x=a(k)-r:a(k)-1;
                      MARK=caculation(x,y,t);               
                      count=count+MARK;
                end

                 for x=a(k)+1:a(k)+r;
                      MARK=caculation(x,y,t);               
                      count=count+MARK;
                end
                
        end
        
              PerStr=round(100*f/al,3); %fix是向0靠拢取整函数
              str=['正在运行中',num2str(PerStr),'%']; 
              waitbar(f/al,hb,str);
        
end

        strdelta=['目前还相差',num2str(deltaM1)];
        strcount=['总共有',num2str(count),'个点改变了'];
        disp(strdelta);disp(strcount);
close(hb);
        toc;
end

