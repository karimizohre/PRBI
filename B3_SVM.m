% for i=1:5

load('.\data\data.mat');
rng('default');
i=3;
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


modelLinear = fitrsvm(normalizedData,YData(:,i),'KernelFunction','linear','KFold',3,'KernelScale',0.1);
yHatSVMLinear = kfoldPredict(modelLinear) ;
measuresLinear=computeMeasures(yHatSVMLinear,YData(:,i),0);


modelPOL = fitrsvm(normalizedData,YData(:,i),'KernelFunction','polynomial','KFold',3);
yHatSVMPOL = kfoldPredict(modelPOL) ;
measuresPOL=computeMeasures(yHatSVMPOL,YData(:,i),0);

yHatSVMLinear=yHatSVMLinear';
yHatSVMPOL=yHatSVMPOL';
yHatSVMRBF=yHatSVMRBF';

save('.\results\B3\SVM.mat');
tt=1;
%  mseLin = kfoldLoss(model,'Mode','individual','LossFun','epsiloninsensitive');
%  
%  
%  Mdl = fitrsvm(normalizedData,YData(:,i),'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%     'expected-improvement-plus'));
