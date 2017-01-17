function [E] = Yuanchang(x1,y1,x0,y0,z,a)
%YUANCHANG Summary of this function goes here
%   Detailed explanation goes here
 x=2*a*x1;
 y=2*a*y1;
 E=(4*a^2/z)*(exp((1i*pi/z)*((x - x0)^2 + (y - y0)^2)))*(sinc((2*a*(x - x0)/z)))*(sinc((2*a*(y - y0)/z)));
end

