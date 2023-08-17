function [bestRTEFile, bestRTEIdx]=findBestRTE(output)

load(strcat('.\results\',output,'\RTE1.mat'));
for i=1:11
    if i<6 || i>10
        [m1(i) i1(i)]=min(finalResultsRTE(:,i));
    else
        [m1(i) i1(i)]=max(finalResultsRTE(:,i));
    end
end
bestIdx1=mode(i1);
bestValues1=finalResultsRTE(bestIdx1,:);
load(strcat('.\results\',output,'\RTE2.mat'));
for i=1:11
    if i<6 || i>10
        [m2(i) i2(i)]=min(finalResultsRTE(:,i));
    else
        [m2(i) i2(i)]=max(finalResultsRTE(:,i));
    end
end
bestIdx2=mode(i2);
bestValues2=finalResultsRTE(bestIdx2,:);
load(strcat('.\results\',output,'\RTE3.mat'));
for i=1:11
    if i<6 || i>10
        [m3(i) i3(i)]=min(finalResultsRTE(:,i));
    else
        [m3(i) i3(i)]=max(finalResultsRTE(:,i));
    end
end
bestIdx3=mode(i3);
bestValues3=finalResultsRTE(bestIdx3,:);
%%test
bestRTEFile='RTE1';
bestRTEIdx=4;
end