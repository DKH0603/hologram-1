function [Finall_AIM] = loadpic(name)
global INx INy;
%LOADPIC Summary of this function goes here
%   Detailed explanation goes here
% Import AIM.png


% standardizing AIM
% [aim_x,aim_y]=size(AIM);
% if aim_x<=INx+1
%     ZEROM=zeros(INx+1-aim_x,aim_y);
%     AIM=[AIM',ZEROM']';
%     disp('���ͼƬx̫С���Ѿ���������')
% else
%     AIM(INx+2:aim_x,:)=[];
%     disp('���ͼƬx̫С���Ѿ����Ҳü�')
% end
% [aim_x,aim_y]=size(AIM);
% if aim_y<=INy+1
%     ZEROM=zeros(aim_x,INy+1-aim_y);
%     AIM=[AIM,ZEROM];
%     disp('���ͼƬy̫С���Ѿ���������')
% else
%     AIM(:,INy+2:aim_y)=[];
%     disp('���ͼƬy̫���Ѿ����Ҳü�')
% end

disp(size(AIM));
imagesc(AIM);
Finall_AIM=AIM;



end

