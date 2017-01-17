global INMatrix Z ;
 FFF=zeros(101);
 for i=1:101
     for j=1:101
       FFF(i,j)=10^11*Yuanchang(i-51,j-51,0,0,353,0.3);
    end
 end

% FFF=zeros(200);
%  for i=151:200
%      for j=151:200
%        FFF(i,j)=INMatrix(i-150,j-150);
%     end
%  end

IN=INMatrix;
cf=mycon2(FFF,IN);
 sf=abs(cf).^2;
%  sf=conv2(FFF,INMatrix);
 figure(1);
 imshow(Norm(sf));
 
% IN(200,200)=0;
% FFF(200,200)=0;
%  c=ifft2(fft2(IN).*fft2(FFF));
%  cf=c(51:150,51:150);

 
%  a=[8,1,6;3,5,7;2,5,6];
%  
%  b=[1,1,1;1,1,1;1,1,1];
% 
%  c1=ifft2(fft2(a).*fft2(b));
% 
%  c2=conv2(a,b);
%  x=[1,2,3];y=[4,5,6,7,8];
%  X = fft([x zeros(1,length(y)-1)]); % x和y是要计算卷积的序列
%  Y = fft([y zeros(1,length(x)-1)]);
% %  X = fft(x); % x和y是要计算卷积的序列
% %  Y = fft(y);
%  z1 = ifft(X.*Y) % 结果存为z
%  z2 = conv(x,y)