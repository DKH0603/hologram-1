function [ out ] = mycon(in)
%MYCON Summary of this function goes here
%   Detailed explanation goes here

global fftz
global INx INy
global OUTx OUTy

in(OUTx+2*INx,OUTy+2*INy)=0;
c=ifft2(fftz.*fft2(in));
out=c(INx+1:INx+OUTx,INy+1:INy+OUTy);

end

