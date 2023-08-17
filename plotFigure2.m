% scatter(YData(:,currentY),yHatGenfis(1,:)');
close all;
currentOutput='B5';
currentY=1;
switch currentOutput
    case 'B1'
%%B1
bestRTEFile='RTE1.mat';
bestRTEIdx=4;
    case 'B2'
%%B2
bestRTEFile='RTE3.mat';
bestRTEIdx=11;
    case 'B3'
%%B3
bestRTEFile='RTE1.mat';
bestRTEIdx=15;
    case 'B4'
%%B4
bestRTEFile='RTE1.mat';
bestRTEIdx=4;
    case 'B5'
%%B5
bestRTEFile='RTE1.mat';
bestRTEIdx=7;

end


load('.\data\data.mat');


load(strcat('.\results\',currentOutput,'\regression.mat'));
y=predictedYLinear';
strTitle='REG_LIN';
x=YData(:,currentY);
plotScatterPlot(x,y,measuresLinear.R2, strTitle,currentOutput);

y=predictedYExp';
strTitle='REG_EXP';
x=YData(:,currentY);
plotScatterPlot(x,y,measuresExp.R2, strTitle,currentOutput);

% load(strcat('.\results\',currentOutput,'\SVM.mat'));

load(strcat('.\results\',currentOutput,'\SVM_pol.mat'));
y=yHatSVMPOL';
strTitle='SVM_POL';
x=YData(:,currentY);
plotScatterPlot(x,y,measuresPOL.R2, strTitle,currentOutput);

load(strcat('.\results\',currentOutput,'\SVM_linear.mat'));
y=yHatSVMLinear';
strTitle='SVM_LIN';
x=YData(:,currentY);
plotScatterPlot(x,y,measuresLinear.R2, strTitle,currentOutput);

load(strcat('.\results\',currentOutput,'\SVM_RBF.mat'));
y=yHatSVMRBF;
strTitle='SVM_RBF';
x=YData(:,currentY);
plotScatterPlot(x,y,measuresRBF.R2, strTitle,currentOutput);


load(strcat('.\results\',currentOutput,'\GENFIS.mat'));
y=yHatGenfis(1,:)';
strTitle='GENFIS';
x=YData(:,currentY);
plotScatterPlot(x,y,measuresGenfis.R2, strTitle,currentOutput);


load(strcat('.\results\',currentOutput,'\',bestRTEFile));
y=yHatRTE(:,4);
strTitle='RTE';
x=YData(:,currentY);
plotScatterPlot(x,y,finalResultsRTE(bestRTEIdx,7)/100, strTitle,currentOutput);




% hold on; 
% Xmin=min(YData(:,currentY));
% XMax=max(YData(:,currentY));
% step=(XMax-Xmin)/10;
% X(1)=max(0,Xmin-2*step);
% for i=2:11
%     X(i)=X(i-1)+step;
% end
% X(12)=XMax;
% plot(X,X,'--k');
% model = fitlm(YData(:,currentY),yHatGenfis(1,:)');
% % formula1=model.Coefficients(1,1);
% % formula2=model.Coefficients(2,1);
% % predictedYTe= predict(model,xTe);
% % output=model.Coefficients(1,1)+model.Coefficients(2,1).*YData(:,currentY);
% plot(YData(:,currentY),model.Fitted,'-b');
% predictedYTe= predict(model,X');
% plot(X',predictedYTe,'-b');