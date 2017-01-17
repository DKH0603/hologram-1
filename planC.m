function [count] = planC(r,t)
global  deltaM1 ;
global  xu_x xu_y ;
global  Sumback;
global  Sum;

count=0;

lx=length(xu_x);
ly=length(xu_y);
randx=xu_x(randperm(lx));
randy=xu_y(randperm(ly));

modrandx=randx(1:floor(lx/r));
modrandy=randy(1:floor(ly/r));

lxx=length(modrandx);
lyy=length(modrandy);
lxy=lxx*lyy;
tt=0;
hc = waitbar(0,'Please wait...');
for i=1:lxx
    x=modrandx(i);
    for j=1:lyy   
        y=modrandy(j);
        
          MARK=caculation(x,y,t);               
          count=count+MARK;
          tt=tt+1;
           PerStr=fix(100*tt/lxy); %fix是向0靠拢取整函数
           str=['随机全扫进度',num2str(PerStr),'%']; 
           waitbar(tt/lxy,hc,str);
    end
end
close(hc);


end