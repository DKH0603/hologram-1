function [M] = ChooseMM(x,y,Z,HINx,HOUTx,HINy,HOUTy)
%CHOOSEM Summary of this function goes here
%   Detailed explanation goes here

M=Z(2*HINx - x + 2+1:2*HOUTx + 2*HINx - x + 2,2*HINy + 2 - y+1:2*HOUTy + 2*HINy + 2 - y);
        
end

