global maxa ta;
global maxc stepc tc maxS tS;

RunplanA(maxa,ta);%RunplanA(循环次数,1/T);
% RunplanB(maxb,1,0);%RunplanB(循环次数,搜索半径,1/T);
RunplanC(maxc,stepc,tc);%RunplanB(循环次数,搜索间隔,1/T);
fanfan2(maxS,tS)