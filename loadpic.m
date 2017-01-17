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
%     disp('你的图片x太小，已经被我扩充')
% else
%     AIM(INx+2:aim_x,:)=[];
%     disp('你的图片x太小大，已经被我裁剪')
% end
% [aim_x,aim_y]=size(AIM);
% if aim_y<=INy+1
%     ZEROM=zeros(aim_x,INy+1-aim_y);
%     AIM=[AIM,ZEROM];
%     disp('你的图片y太小，已经被我扩充')
% else
%     AIM(:,INy+2:aim_y)=[];
%     disp('你的图片y太大，已经被我裁剪')
% end

disp(size(AIM));
imagesc(AIM);
Finall_AIM=AIM;



end

