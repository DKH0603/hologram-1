function [small_AIM] = scale(pic,targe_x,targe_y)
%SCALE Summary of this function goes here
%   Detailed explanation goes here
[lengx,lengy]=size(pic);
stepx=lengx/targe_x;
stepy=lengy/targe_y;
small_AIM=zeros(targe_x,targe_y);
for i=1:targe_x
    for j=1:targe_y
      small_AIM(i,j)=sum(sum(pic(stepx*(i-1)+1:stepx*i,stepy*(j-1)+1:stepy*j)))/(stepx*stepy);
    end
end

end

