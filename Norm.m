function [M] = Norm(m)
%NORM Summary of this function goes here
%   Detailed explanation goes here
 SSUM =sum(sum(m));
 N=prod(size(m));
 M=m*N/SSUM;

end

