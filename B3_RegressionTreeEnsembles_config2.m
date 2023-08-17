% tic
currentY=3;
load('.\data\data.mat');
% Mdl1 = fitrensemble(normalizedData,YData(:,currentY),'CrossVal','on','KFold',3);
% yHat = kfoldPredict(Mdl1) ;
% measures=computeMeasures(yHat,YData(:,currentY),0);
% toc
% 
% t = templateTree('MaxNumSplits',1);
% Mdl = fitrensemble(normalizedData,YData(:,currentY),'NumBins',50);
% % Mdl = fitrensemble(normalizedData,YData(:,currentY),'Learners',t,'CrossVal','on','KFold',3);
% % Mdl = fitrensemble([Horsepower,Weight],MPG,'OptimizeHyperparameters','auto')
% % kflc = kfoldLoss(Mdl,'Mode','cumulative');
% % figure;
% % plot(kflc);
% % ylabel('10-fold cross-validated MSE');
% % xlabel('Learning cycle');
% % estGenError = kflc(end);
% 
rng('default')
% rng('default')
% t = templateTree('Reproducible',true);
% Mdl = fitrensemble(normalizedData,YData(:,currentY),'OptimizeHyperparameters','auto','Learners',t, ...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'));
% 


n = size(normalizedData,1);
m = floor(log2(n - 1));
learnRate = [0.1 0.25 0.5 0.75 1];
numLR = numel(learnRate);
maxNumSplits = 2.^(0:m);
numMNS = numel(maxNumSplits);
numTrees = 200;
MdlRTE = cell(numMNS,numLR);

for k = 1:numLR
    for j = 1:numMNS
        t = templateTree('MaxNumSplits',maxNumSplits(j),'Surrogate','on');
        MdlRTE{j,k} = fitrensemble(normalizedData,YData(:,currentY),'NumLearningCycles',numTrees, ...
            'Learners',t,'KFold',3,'LearnRate',learnRate(k));
    end
end
idx=1;
for k=1:numLR
    for j=1:numMNS
        yHatRTE (:,idx)= kfoldPredict( MdlRTE{j,k}) ;
        measures=computeMeasures(yHatRTE(:,idx),YData(:,currentY),0);
        results(k,j,:)=measures.array;
        idx=idx+1;
        
    end
end
idx=1;
for k=1:numLR
    for j=1:numMNS
         finalResultsRTE(idx,:)=results(k,j,:);
         idx=idx+1;
    end
end
save('.\results\B3\RTE2.mat');
tt=1;
