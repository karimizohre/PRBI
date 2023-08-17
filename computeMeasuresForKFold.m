function [meanMSE,stdMSE]=computeMeasuresForKFold(output,realValue)
for i=1:13
    e1(i)= realValue(i)-output(i);
end
for i=14:26
    e2(i)= realValue(i)-output(i);
end
for i=27:39
    e3(i)= realValue(i)-output(i);
end
MSE1=sum(e1.^2)/13;
MSE2=sum(e2.^2)/13;
MSE3=sum(e3.^2)/13;
meanMSE=(MSE1+MSE2+MSE3)/3;
stdMSE=std([MSE1,MSE2,MSE3]);