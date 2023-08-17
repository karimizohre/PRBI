
% currentOutput='B2';
% bestRTEFile='RTE1.mat';
% bestRTEIdx=4;

currentOutput='B5';
%%[bestRTEFile, bestRTEIdx]=findBestRTE(currentOutput)
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
load(strcat('.\results\',currentOutput,'\regression.mat'));
finalTable=[];
finalTable=[finalTable;measuresLinear.array;measuresExp.array;];
% finalTable=[finalTable;measuresLinear.array;measuresExp.array;resultsExpOneVariable];
load(strcat('.\results\',currentOutput,'\SVM.mat'));

finalTable=[finalTable;measuresLinear.array;measuresPOL.array;measuresRBF.array];
load(strcat('.\results\',currentOutput,'\',bestRTEFile));
finalTable=[finalTable;finalResultsRTE(bestRTEIdx,:)];
load(strcat('.\results\',currentOutput,'\GENFIS.mat'));
finalTable=[finalTable;measuresGenfis.array];
finalTable=finalTable';
removeIdx=[4,5,8,9,10];
finalTable(removeIdx,:)=[];
tt=1;

% plot(x,y1,'g',x,y2,'b--o',x,y3,'c*')
