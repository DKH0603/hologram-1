% function [Sum,deltaM1,INMatrix,count] = planA(Sum,deltaM1,INMatrix,Z,HINx,HOUTx,HINy,HOUTy,Norm_AIM)
%PLANA Summary of this function goes here
%   Detailed explanation goes here
function [count] = planA(t)
global  deltaM1 ;
global  INx INy ;
global  xu_x xu_y ;



count=0;

randx=xu_x(randperm(length(xu_x)));
randy=xu_y(randperm(length(xu_y)));
if INx*INy > 20000;
h1 = waitbar(0,'Please wait...');
h2 = waitbar(0,'Please wait...');
for i=1:INx 
    x=randx(i);
    tic;
        for j=1:INy     
            y=randy(j);       

              count=count+caculation(x,y,t);
       
              
              PerStr=fix(100*j/INy); %fix是向0靠拢取整函数
              str=['横向全扫',num2str(PerStr),'%']; 
              waitbar(j/INy,h2,str);
        
              
        end
    
        
          toc;
          
          PerStr=round(100*i/INx,3); %fix是向0靠拢取整函数
          str=['纵向全扫',num2str(PerStr),'%']; 
          waitbar(i/INx,h1,str);
    
          
     
end

close(h1);
close(h2);
else
    tic;
    for i=1:INx 
    x=randx(i);  
        for j=1:INy     
            y=randy(j);       
            count=count+caculation(x,y,t);
        end
    end
    toc;
end


% OutSum=Sum;
% OutdeltaM1=deltaM1;
% OutINMatrix=INMatrix;
end

