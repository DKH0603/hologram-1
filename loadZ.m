function [] = loadZ(name)
%LOADZ Summary of this function goes here
%   Detailed explanation goes here
global halfx  halfy;
global z0 a0;

sgc_exist = exist(name, 'file');
if sgc_exist==0
    Z=[];
    for i=1:(2*halfx+1)
        for j=1:(2*halfy+1)
            Z(i,j)=10^11*Yuanchang(i-1-halfx,j-1-halfy,0,0,z0,a0);
        end
    end
    save(name,'Z');
end

end

