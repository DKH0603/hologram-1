INx=100;INy=100;
OUTx=100;OUTy=100;
AIM=imread('A.bmp');
[a,b]=find(AIM);
randnum=2*pi*rand(1,length(a));
randphase=cos(randnum)+i*sin(randnum);
art=full(sparse(a,b,randphase,OUTx,OUTy));

fart=zeros(INx+OUTx+1,INy+OUTy+1);
fart(floor(INx/2)+1:floor(INx/2)+OUTx,floor(INy/2)+1:floor(INy/2)+OUTy)=art;

field=ifft(fft(fart)./fft(Z));
outfield=abs(field);
imshow(outfield);