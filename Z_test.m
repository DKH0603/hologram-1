% for 100*100px
INx = 200;HINx = INx/2;       % (*������ĺ�(����)*)(*�����ó�ż��*)
INy = 200;HINy = INy/2;       % (*���������(����)*)(*�����ó�ż��*)
OUTx = 100;HOUTx = OUTx/2;    % (*������ĺ�(����)*)(*�����ó�ż��*)
OUTy = 100;HOUTy = OUTy/2;    % (*���������(����)*)(*�����ó�ż��*)
z0 = 353;                     % (*������еĴ�������*)
a0 = 0.3;                     % (*ÿ��С���Ӱ�߳�*)
halfx = HOUTx + HINx;         %(*��������Ҫ��֤��x����뾶*)
halfy = HOUTy + HINy;         %(*��������Ҫ��֤��x����뾶*)

name=['Z_',num2str(INx),'_',num2str(INy),'_',num2str(OUTx),'_',num2str(OUTy),'_',num2str(a0),'_',num2str(z0),'.mat'];

loadZ(name,halfx,halfy,z0,a0);