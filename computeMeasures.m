function measures=computeMeasures(output,realValue,p)
%p=7;%% linear regression
%p=8; %%exponential
measures.R = corrcoef( output , realValue ) ;
%%Relative Absolute error weka & Root relative absolute error
n=length(output);
meanRealValue=mean(realValue);
meanOutput=mean(output);
for i=1:n
    e(i)= realValue(i)-output(i);
    temp4R2_R(i)=(realValue(i)-meanRealValue);
    temp4R2_O(i)=(output(i)-meanOutput);
end
measures.MSE=sum(e.^2)/n;
%%measures.MSE=sum(e.^2)/(n-p);  in malab
measures.RAE=sum(abs(e))/sum(abs(temp4R2_R));
measures.RRSE=sqrt(sum(e.^2)/sum(temp4R2_R.^2));
measures.RMSE = sqrt(mean(e.^2));  % Root Mean Squared Error
measures.MAE=mean(abs(e));%% mean absolute Error
measures.VAF=1-(var(e)/var(realValue));
measures.R2 =(sum ( temp4R2_R.*temp4R2_O)/(sqrt(sum(temp4R2_O.^2))*sqrt(sum(temp4R2_R.^2))))^2;
measures.AdjR2=1-((n-1)*(1-measures.R2)/(n-p-1));
measures.PI=measures.AdjR2+(0.01*measures.VAF)-measures.RMSE;
measures.ErrorStD=sqrt(abs(sum(abs(e))-mean(abs(e)))/(n-1));
measures.array=[measures.MSE,measures.RAE,measures.RRSE,measures.RMSE,measures.MAE,measures.VAF,100*measures.R2,100*measures.AdjR2,measures.PI,measures.R(1,2),measures.ErrorStD];
end
