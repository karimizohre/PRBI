function prepareDataset()
%min-max normalize
minData=[15,0,90,2000,10,2];
maxData=[30,20,100,7000,60,20];
% 
for i=1:6
   normalizedData(:,i)=(XData(:,i)-minData(i))/(maxData(i)-minData(i));
end

for i=1:5
    normalizedY(:,i)=(YData(:,i)-minData(i))/(maxData(i)-minData(i));
end
% for i=1:6
%     minData=min(XData(:,i));
%     maxData=max(XData(:,i));
%     normalizedData(:,i)=(XData(:,i)-minData)/(maxData-minData);
% end
% 
% for i=1:5
%     minData=min(YData(:,i));
%     maxData=max(YData(:,i));
%     normalizedY(:,i)=(YData(:,i)-minData)/(maxData-minData);
% end

tt=1;
end