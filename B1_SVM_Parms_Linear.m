% for i=1:5
clear;
close;

rng('default');
load('.\data\data.mat');
bi=1;
maxC=2^5;
% maxGamma=2^5;
% minGamma=2^-5;

% modelRBF = fitrsvm(normalizedData,YData(:,bi),'KernelFunction','gaussian','KFold',3);
n=length(YData(:,bi));
randIdx=randperm(n);
foldIdx(1,:)=randIdx(1:13);
foldIdx(2,:)=randIdx(14:26);
foldIdx(3,:)=randIdx(27:39);
foldValues=[1 2 3];
minC=1;
C=minC;%%2^-5;

i=0;
stepC=2^0.5;
CValues=[];
while C<=maxC
    i=i+1;
    CValues(i)=C;
    C=C+stepC;%% 2^0.1
end

j=0;
epsilon=0.01;
epsilonValues=[];
stepEpsilon=0.05;%0.01
while epsilon<= 1.0
    j=j+1;
    epsilonValues(j)=epsilon;
    epsilon=epsilon+stepEpsilon;
end
% gamma=minGamma;
% stepGamma=2^0.2;
% k=0;
% gammaValues=[];
% while gamma<=maxGamma
%     k=k+1;
%     gammaValues(k)=gamma;
%     gamma=gamma+stepGamma;
% end

j=0;k=0;f=0;
C=minC;
epsilon=0.01;
% gamma=minGamma;
for fold=1:3
    f=f+1;
    testIdx=foldIdx(fold,:);
    trainIdx=[1:n];
    trainIdx(testIdx)=[]; 
    i=0;
    C=minC;
    while C<=maxC
        i=i+1;j=0;
        epsilon=0.01;
        while epsilon<= 1.0
            j=j+1;k=0;
%             gamma=minGamma;
%             while gamma<=maxGamma
%                 k=k+1;
                fold
                C
                epsilon
%                 gamma
                %fprintf ('fold=%5.2f',fold, ', C=%5.2f',C,', epsilon=%5.2f', epsilon,', gamma=%5.2f',gamma);
                modelLinear = fitrsvm(normalizedData(trainIdx,:),YData(trainIdx,bi),'KernelFunction','linear','epsilon',epsilon,'BoxConstraint',C);
                %%yHatSVMRBF = kfoldPredict(modelRBF) ;
                yHatSVMLinear=predict(modelLinear,normalizedData(testIdx,:));
                measuresLinear=computeMeasures(yHatSVMLinear,YData(testIdx,bi),0);
                mse(f,i,j)=measuresLinear.MSE;
                r2(f,i,j)=measuresLinear.R2;
%                 gamma=gamma+stepGamma;
%             end
            save(strcat('E:/resultsPaperFreidooni/cv_B1_SVM_Fold_',num2str(fold),'_C_',num2str(C),'_epsilon_',num2str(epsilon),'.mat'));
            epsilon=epsilon+stepEpsilon;
        end
        C=C+stepC;%% 2^0.1
    end
end
fitFold1=r2(1,:,:)+(1./mse(1,:,:));
fitFold2=r2(2,:,:)+(1./mse(2,:,:));
fitFold3=r2(3,:,:)+(1./mse(3,:,:));
[minFold1 bestFitFold1]=max(fitFold1(:));
[minFold2 bestFitFold2]=max(fitFold2(:));
[minFold3 bestFitFold3]=max(fitFold3(:));
[bestF1, bestCIdx1, bestepsilonIdx1] = ind2sub( size(fitFold1), bestFitFold1 );
[bestF2, bestCIdx2, bestepsilonIdx2] = ind2sub( size(fitFold2), bestFitFold2 );
[bestF3, bestCIdx3, bestepsilonIdx3] = ind2sub( size(fitFold3), bestFitFold3 );
%create result matrix 
%fold1
f=1;
restultTable(f,1)=epsilonValues(bestepsilonIdx1);
restultTable(f,2)=CValues(bestCIdx1);
restultTable(f,4)=mse(f, bestCIdx1, bestepsilonIdx1);
restultTable(f,5)=r2(f, bestCIdx1, bestepsilonIdx1);
%fold2
f=2;
restultTable(f,1)=epsilonValues(bestepsilonIdx2);
restultTable(f,2)=CValues(bestCIdx2);
restultTable(f,4)=mse(f, bestCIdx2, bestepsilonIdx2);
restultTable(f,5)=r2(f, bestCIdx2, bestepsilonIdx2);
%fold 3
f=3;
restultTable(f,1)=epsilonValues(bestepsilonIdx3);
restultTable(f,2)=CValues(bestCIdx3);
restultTable(f,4)=mse(f, bestCIdx3, bestepsilonIdx3);
restultTable(f,5)=r2(f, bestCIdx3, bestepsilonIdx3);

yHatSVMLinear=[];
% findResultsOfTheBestSetting
for fold=1:3
    testIdx=foldIdx(fold,:);
    trainIdx=[1:n];
    trainIdx(testIdx)=[];
    switch fold
        case 1
            epsilon=epsilonValues(bestepsilonIdx1);           
            C=CValues(bestCIdx1);
        case 2
            epsilon=epsilonValues(bestepsilonIdx2);
            
            C=CValues(bestCIdx2);
        case 3
            epsilon=epsilonValues(bestepsilonIdx3);
            
            C=CValues(bestCIdx3);
    end
    modelLinear = fitrsvm(normalizedData(trainIdx,:),YData(trainIdx,bi),'KernelFunction','linear','epsilon',epsilon,'BoxConstraint',C);
    %%yHatSVMRBF = kfoldPredict(modelRBF) ;
    yHatSVMLinear(testIdx)=predict(modelLinear,normalizedData(testIdx,:));
%     measuresRBF=computeMeasures(yHatSVMRBF(testIdx),YData(testIdx,bi),0);
end
measuresLinear=computeMeasures(yHatSVMLinear,YData(:,bi),0);

save('.\results\B1\SVM_Linear.mat');
f=1;myPlotSurfFrom4Dim(CValues, epsilonValues, mse(:,:,:),f,restultTable(f,2),restultTable(f,3),restultTable(f,4),stepC,stepGamma);
f=2;myPlotSurfFrom4Dim(CValues, gammaValues, mse(:,:,:),f,restultTable(f,2),restultTable(f,3),restultTable(f,4),stepC,stepGamma);
f=3;myPlotSurfFrom4Dim(CValues, gammaValues, mse(:,:,:),f,restultTable(f,2),restultTable(f,3),restultTable(f,4),stepC,stepGamma);
% yHatSVMRBF = kfoldPredict(modelRBF) ;


%  model.ConvergenceInfo.Converged
 %%'linear','polynomial'
%  mseLin = kfoldLoss(model)
%  mseLin = kfoldLoss(model,'Mode','individual')
% % end
% yHat = kfoldPredict(model) ;
% measures=computeMeasures(yHat,YData(:,i),0);


% modelLinear = fitrsvm(normalizedData,YData(:,bi),'KernelFunction','linear','KFold',3);
% yHatSVMLinear = kfoldPredict(modelLinear) ;
% measuresLinear=computeMeasures(yHatSVMLinear,YData(:,bi),0);
% 
% 
% modelPOL = fitrsvm(normalizedData,YData(:,bi),'KernelFunction','polynomial','KFold',3);
% yHatSVMPOL = kfoldPredict(modelPOL) ;
% measuresPOL=computeMeasures(yHatSVMPOL,YData(:,bi),0);
% 
% save('.\results\B1\SVM.mat');
% tt=1;
%  mseLin = kfoldLoss(model,'Mode','individual','LossFun','epsiloninsensitive');
%  
%  
%  Mdl = fitrsvm(normalizedData,YData(:,i),'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%     'expected-improvement-plus'));
