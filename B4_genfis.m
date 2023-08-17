% opt.InitialFIS = 4;
% opt.EpochNumber = 30
% 'ErrorGoal'
% 'InitialStepSize'
% 'StepSizeDecreaseRate'
% 'StepSizeIncreaseRate'
% 'DisplayANFISInformation'
% 'DisplayErrorValues'
% 'DisplayStepSize'
% 'DisplayFinalResults'
% 'ValidationData'
% 'OptimizationMethod'
% opt2 = anfisOptions('InitialFIS',4,'EpochNumber',30);

% opt.NumMembershipFunctions = [3 5];
% opt.InputMembershipFunctionType = ["gaussmf" "trimf"];
% opt = genfisOptions('GridPartition');
load('.\data\data.mat');
opt = genfisOptions('FCMClustering','FISType','sugeno');
opt.NumClusters = 3;
opt.Verbose = 0;

k=3;
n=39;
CVO = cvpartition(n,'k',k);
currentY=4;
output = zeros(CVO.NumTestSets,1);
idx=1;
%%%%%%%%Linear Regression by CV
minData=[0,0,0,0,0,0];
maxData=[1,1,1,1,1,1];
minY=[min(YData(:,1)),min(YData(:,2)),min(YData(:,3)),min(YData(:,4)),min(YData(:,5))];
maxY=[max(YData(:,1)),max(YData(:,2)),max(YData(:,3)),max(YData(:,4)),max(YData(:,5))];
for r=2:10
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        xTr=normalizedData(trIdx,:);
        xTe=normalizedData(teIdx,:);
        
        %         xTr=XData(trIdx,:);
        %     xTe=XData(teIdx,:);
        
        yTr=YData(trIdx,currentY);
        yTe=YData(teIdx,currentY);
        
        % fis = genfis3(xTr,yTr,'sugeno') ;%%%%%%%%%%%%%ok
        opt.NumClusters=r;
        fis = genfis([xTr;minData;maxData],[yTr;minY(currentY);maxY(currentY)],opt) ;
        %     fis = genfis3(xTr,yTr,'mamdani') ;
        %     fis = anfis([xTr,yTr]);
        output(teIdx)=evalfis(fis,xTe);
        anfisModel(i)=fis;
        %     err(i) = sum(~strcmp(ytest,dataan(teIdx)));
    end
    measuresGenfis=computeMeasures(output,YData(:,currentY),0);
    results(idx,:)=measuresGenfis.array;
    yHatGenfis(idx,:)=output;
    idx=idx+1;
end
save('.\results\B4\GENFIS.mat');
