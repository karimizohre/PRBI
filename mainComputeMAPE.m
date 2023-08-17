close all;
% currentOutput='B2';
% bestRTEFile='RTE1.mat';
% bestRTEIdx=4;

currentOutput='B3';
%%[bestRTEFile, bestRTEIdx]=findBestRTE(currentOutput)
switch currentOutput
    case 'B1'
%%B1
bestRTEFile='RTE1.mat';
bestRTEIdx=4;
currentY=1;
    case 'B2'
%%B2
bestRTEFile='RTE3.mat';
bestRTEIdx=11;
currentY=2;
    case 'B3'
%%B3
bestRTEFile='RTE1.mat';
bestRTEIdx=15;
currentY=3;
    case 'B4'
%%B4
bestRTEFile='RTE1.mat';
bestRTEIdx=4;
currentY=4;
    case 'B5'
%%B5
bestRTEFile='RTE1.mat';
bestRTEIdx=7;
currentY=5;
end
% for i=1:39
%     X(i)=i;
% end
load(strcat('.\results\',currentOutput,'\regression.mat'));
MAPELIN=computeMAPE(predictedYLinear',YData(:,currentY));
MAPEEXP=computeMAPE(predictedYExp',YData(:,currentY));
 
% plot(X,predictedYExp','MarkerFaceColor' ,'#D95319', 'marker','v','LineStyle' ,'none');


% load(strcat('.\results\',currentOutput,'\SVM.mat'));
load(strcat('.\results\',currentOutput,'\SVM_linear.mat'));
% plot(X,yHatSVMLinear,'dg');
MAPESVMLinear=computeMAPE(yHatSVMLinear,YData(:,currentY));

load(strcat('.\results\',currentOutput,'\SVM_pol.mat'));
MAPEyHatSVMPOL=computeMAPE(yHatSVMPOL,YData(:,currentY));

% plot(X,yHatSVMPOL,'sc');
load(strcat('.\results\',currentOutput,'\SVM_RBF.mat'));
MAPEyHatSVMRBF=computeMAPE(yHatSVMRBF,YData(:,currentY));

% plot(X,yHatSVMRBF,'hm');

load(strcat('.\results\',currentOutput,'\',bestRTEFile));
MAPEyHatRTE=computeMAPE(yHatRTE(:,bestRTEIdx),YData(:,currentY));

% plot(X,yHatRTE(:,bestRTEIdx),'Ob');
load(strcat('.\results\',currentOutput,'\GENFIS.mat'));
MAPEyHatGenfis=computeMAPE(yHatGenfis(1,:)',YData(:,currentY));

% plot(X,yHatGenfis(1,:)','*r');
% legend('observed','REG-LIN','REG-EXP','SVM-LIN','SVM-POL','SVM-RBF','RTE','GENFIS','Location','north');
% xlabel('Data Points');
% ylabel(currentOutput);
% set(gca,'TickDir','out');
% plot(x,y1,'g',x,y2,'b--o',x,y3,'c*')
MAPE=[MAPELIN, MAPEEXP, MAPESVMLinear, MAPEyHatSVMPOL, MAPEyHatSVMRBF, MAPEyHatRTE, MAPEyHatGenfis]