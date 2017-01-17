% for 100*100px
INx = 200;HINx = INx/2;       % (*入射面的横(像素)*)(*请设置成偶数*)
INy = 200;HINy = INy/2;       % (*入射面的纵(像素)*)(*请设置成偶数*)
OUTx = 100;HOUTx = OUTx/2;    % (*出射面的横(像素)*)(*请设置成偶数*)
OUTy = 100;HOUTy = OUTy/2;    % (*出射面的纵(像素)*)(*请设置成偶数*)
z0 = 353;                     % (*计算机中的代数距离*)
a0 = 0.3;                     % (*每个小格子半边长*)
halfx = HOUTx + HINx;         %(*理论上需要保证的x方向半径*)
halfy = HOUTy + HINy;         %(*理论上需要保证的x方向半径*)

name=['Z_',num2str(INx),'_',num2str(INy),'_',num2str(OUTx),'_',num2str(OUTy),'_',num2str(a0),'_',num2str(z0),'.mat'];

loadZ(name,halfx,halfy,z0,a0);