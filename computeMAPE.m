function MAPE=computeMAPE(output,realValue)
n=length(output);
for i=1:n
    e1(i)= abs(realValue(i)-output(i))/realValue(i);
end
MAPE=sum(e1)*100/n;
