% for i=1:5
rng('default');
load('.\data\data.mat');
i=1;
modelRBF = fitrsvm(normalizedData,YData(:,i),'KernelFunction','gaussian','KFold',3);
yHatSVMRBF = kfoldPredict(modelRBF) ;
measuresRBF=computeMeasures(yHatSVMRBF,YData(:,i),0);


%  model.ConvergenceInfo.Converged
 %%'linear','polynomial'
%  mseLin = kfoldLoss(model)
%  mseLin = kfoldLoss(model,'Mode','individual')
% % end
% yHat = kfoldPredict(model) ;
% measures=computeMeasures(yHat,YData(:,i),0);


modelLinear = fitrsvm(normalizedData,YData(:,i),'KernelFunction','linear','KFold',3);
yHatSVMLinear = kfoldPredict(modelLinear) ;
measuresLinear=computeMeasures(yHatSVMLinear,YData(:,i),0);


modelPOL = fitrsvm(normalizedData,YData(:,i),'KernelFunction','polynomial','KFold',3);
yHatSVMPOL = kfoldPredict(modelPOL) ;
measuresPOL=computeMeasures(yHatSVMPOL,YData(:,i),0);

save('.\results\B1\SVM.mat');
tt=1;
%  mseLin = kfoldLoss(model,'Mode','individual','LossFun','epsiloninsensitive');
%  
%  
%  Mdl = fitrsvm(normalizedData,YData(:,i),'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%     'expected-improvement-plus'));
