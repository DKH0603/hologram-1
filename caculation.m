function [mark] = caculation(x,y,t)
%CACULATION Summary of this function goes here
%   Detailed explanation goes here
global INMatrix Norm_AIM Sum deltaM1 Norm_Sum ;

mark=0;
 temp = INMatrix(x,y);
 if temp==0||temp==1
     if temp==0
     SumTemp=Sum+ChooseM(x,y);
     else
     SumTemp=Sum-ChooseM(x,y);
     end
 else
     SumTemp=Sum+(1-temp)*ChooseM(x,y)-temp*ChooseM(x,y);
 end
 
 MSum=abs(SumTemp).^2;
 Norm_Sum=Norm(MSum);
 deltaM2 = sum(sum((Norm_Sum-Norm_AIM).^2/prod(size(Norm_Sum))));
 delta=deltaM2-deltaM1;
 
 if rand<=exp(-delta*deltaM1/t)
   if temp==1||temp==0
      if delta<0
        Sum=SumTemp;
        INMatrix(x,y)=1-temp;
        mark=1;
        deltaM1=deltaM2;
      end    
   else
       Sum=SumTemp;
       INMatrix(x,y)=(1/(1 + exp(deltaM2/delta)) - temp)/exp(-deltaM2) + temp;
       mark=-1;
       deltaM1=deltaM2;
 end
 end
end

