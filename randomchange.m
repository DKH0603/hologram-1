function [ out ] = randomchange( in,T )
%RANDOMCHANGE Summary of this function goes here
%   Detailed explanation goes here
global INx INy
[a,b]=find(in);
a=a';b=b';
L=length(a);
buchang=T;
a = a+round(buchang-2*buchang*rand(1,L));
a = mod(a,INx)+1;
s = sparse( a,b,ones(1,L)',INx,INy) ;
out = sign(full(s));
end

