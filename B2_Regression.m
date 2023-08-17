rng('default')
load('.\data\data.mat');
k=3;
n=39;
CVO = cvpartition(n,'k',k);
currentY=2;
% output = zeros(CVO.NumTestSets,1);
%%%%%%%%Linear Regression by CV
for i = 1:CVO.NumTestSets
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    xTr=normalizedData(trIdx,:);
    xTe=normalizedData(teIdx,:);
    yTr=YData(trIdx,currentY);
    yTe=YData(teIdx,currentY);
    
    model = fitlm(xTr,yTr);
    predictedYTe= predict(model,xTe);
    predictedYLinear(teIdx)=predictedYTe;
    
end
measuresLinear=computeMeasures(predictedYLinear,YData(:,currentY),7);

%%%%%%%%non Linear Regression by CV: exponential
modelfun=@(b,x)b(8)+b(7)*exp(b(1)*x(:,1)+b(2)*x(:,2)+b(3)*x(:,3)+b(4)*x(:,4)+b(5)*x(:,5)+b(6)*x(:,6));
beta0=[1 1 1 1 1 1 1 1];
beta0(1)=max(normalizedData(:,1))/10;
beta0(2)=max(normalizedData(:,2))/10;
beta0(3)=max(normalizedData(:,3))/10;
beta0(4)=max(normalizedData(:,4))/10;
beta0(5)=max(normalizedData(:,5))/10;
beta0(6)=max(normalizedData(:,6))/10;
beta0(7)=max(YData(:,currentY));
beta0(8)=max(YData(:,currentY));
for cvIdx = 1:CVO.NumTestSets
    
    trIdx = CVO.training(cvIdx);
    teIdx = CVO.test(cvIdx);
    xTr=normalizedData(trIdx,:);
    xTe=normalizedData(teIdx,:);
    yTr=YData(trIdx,currentY);
    yTe=YData(teIdx,currentY);
    
    model = fitnlm( xTr ,yTr , modelfun , beta0 );
    predictedYTe= predict(model,xTe);
    predictedYExp(teIdx)=predictedYTe;
end
measuresExp=computeMeasures(predictedYExp,YData(:,currentY),8);
%
%     for j=1:6
%         modelfun=@(b,x)b(3)+b(2)*exp(b(1)*x(:,j));
%         beta0=[1 1 1 ];
%         model = fitnlm( normalizedData ,YData(:,i) , modelfun , beta0 );
%         measures=computeMeasures(model.Fitted,YData(:,i),3);
%         result(j,:)=measures.array;
%     end
% end
% measures=computeMeasures(predictedY,YData(:,currentY),7);
%%%%%%%%non Linear Regression by CV: exponential for one input variable
for j=1:6
    modelfun=@(b,x)b(3)+b(2)*exp(b(1)*x(:,j));
    beta0=[1 1 1 ];
    beta0(1)=max(normalizedData(trIdx,j))/10;
    beta0(2)=max(YData(:,currentY));
    beta0(3)=max(YData(:,currentY));
    for cvIdx = 1:CVO.NumTestSets
        trIdx = CVO.training(cvIdx);
        teIdx = CVO.test(cvIdx);
        xTr=normalizedData(trIdx,:);
        xTe=normalizedData(teIdx,:);
        yTr=YData(trIdx,currentY);
        yTe=YData(teIdx,currentY);
        model = fitnlm( xTr ,yTr , modelfun , beta0 );
        predictedYTe= predict(model,xTe);
        predictedYExpOneVariable(teIdx)=predictedYTe;
    end
    measureExpOneVariable=computeMeasures(predictedYExpOneVariable,YData(:,currentY),3);
    resultsExpOneVariable(j,:)=measureExpOneVariable.array;
end
save('.\results\B2\regression.mat');
tt=1;