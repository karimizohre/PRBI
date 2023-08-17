close all;
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
% for i=1:39
%     X(i)=i;
% end
load(strcat('.\results\',currentOutput,'\regression.mat'));
[meanMSELIN,stdMSELIN]=computeMeasuresForKFold(predictedYLinear',YData(:,currentY));
[meanMSEEXP,stdMSEEXP]=computeMeasuresForKFold(predictedYExp',YData(:,currentY));

% plot(X,predictedYExp','MarkerFaceColor' ,'#D95319', 'marker','v','LineStyle' ,'none');


% load(strcat('.\results\',currentOutput,'\SVM.mat'));
load(strcat('.\results\',currentOutput,'\SVM_linear.mat'));
% plot(X,yHatSVMLinear,'dg');
[meanMSESVMLinear,stdMSESVMLinear]=computeMeasuresForKFold(yHatSVMLinear,YData(:,currentY));
load(strcat('.\results\',currentOutput,'\SVM_pol.mat'));
[meanMSEyHatSVMPOL,stdMSEyHatSVMPOL]=computeMeasuresForKFold(yHatSVMPOL,YData(:,currentY));
% plot(X,yHatSVMPOL,'sc');
load(strcat('.\results\',currentOutput,'\SVM_RBF.mat'));
[meanMSEyHatSVMRBF,stdMSEyHatSVMRBF]=computeMeasuresForKFold(yHatSVMRBF,YData(:,currentY));
% plot(X,yHatSVMRBF,'hm');



load(strcat('.\results\',currentOutput,'\',bestRTEFile));
[meanMSEyHatRTE,stdMSEyHatRTE]=computeMeasuresForKFold(yHatRTE(:,bestRTEIdx),YData(:,currentY));
% plot(X,yHatRTE(:,bestRTEIdx),'Ob');
load(strcat('.\results\',currentOutput,'\GENFIS.mat'));
[meanMSEyHatGenfis,stdMSEyHatGenfis]=computeMeasuresForKFold(yHatGenfis(1,:)',YData(:,currentY));
% plot(X,yHatGenfis(1,:)','*r');
% legend('observed','REG-LIN','REG-EXP','SVM-LIN','SVM-POL','SVM-RBF','RTE','GENFIS','Location','north');
% xlabel('Data Points');
% ylabel(currentOutput);
% set(gca,'TickDir','out');
plotErrorBarGraph(strcat(currentOutput(1),'_',currentOutput(2)),[meanMSELIN,meanMSEEXP,meanMSESVMLinear,meanMSEyHatSVMPOL, meanMSEyHatSVMRBF,meanMSEyHatRTE,meanMSEyHatGenfis ], ...
    [stdMSELIN,stdMSEEXP,stdMSESVMLinear,stdMSEyHatSVMPOL, stdMSEyHatSVMRBF,stdMSEyHatRTE,stdMSEyHatGenfis])
tt=1;

% plot(x,y1,'g',x,y2,'b--o',x,y3,'c*')
