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
for i=1:39
    X(i)=i;
end
load(strcat('.\results\',currentOutput,'\regression.mat'));
plot(X,YData(:,currentY),'-+k');
hold on;
plot(X,predictedYLinear','MarkerFaceColor' ,'#77AC30', 'marker','^','LineStyle' ,'none');
plot(X,predictedYExp','MarkerFaceColor' ,'#D95319', 'marker','v','LineStyle' ,'none');


% load(strcat('.\results\',currentOutput,'\SVM.mat'));
load(strcat('.\results\',currentOutput,'\SVM_linear.mat'));
plot(X,yHatSVMLinear,'dg');
load(strcat('.\results\',currentOutput,'\SVM_pol.mat'));
plot(X,yHatSVMPOL,'sc');
load(strcat('.\results\',currentOutput,'\SVM_RBF.mat'));
plot(X,yHatSVMRBF,'hm');



load(strcat('.\results\',currentOutput,'\',bestRTEFile));
plot(X,yHatRTE(:,bestRTEIdx),'Ob');
load(strcat('.\results\',currentOutput,'\GENFIS.mat'));
plot(X,yHatGenfis(1,:)','*r');
legend('observed','REG-LIN','REG-EXP','SVM-LIN','SVM-POL','SVM-RBF','RTE','GENFIS','Location','north');
xlabel('Data Points');
ylabel(currentOutput);
set(gca,'TickDir','out');

tt=1;

% plot(x,y1,'g',x,y2,'b--o',x,y3,'c*')
