function [ out ] = myconv2( a,b )
%MYCON2 Summary of this function goes here
%   Detailed explanation goes here

ta=a;tb=b;
[x1,y1]=size(a);
[x2,y2]=size(b);
x=x1+x2-1;y=y1+y2-1;
ta(x,y)=0;tb(x,y)=0;
c=ifft2(fft2(ta).*fft2(tb));
out=c(floor(x1/2)+1:floor(x1/2)+x2,floor(y1/2)+1:floor(y1/2)+y2);
end

