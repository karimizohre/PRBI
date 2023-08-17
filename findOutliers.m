currentY=1;
outlierFlag1=  isoutlier(YData(:,currentY));
oultlierIdx1=find(outlierFlag1==1);
lenOutlier1=length(oultlierIdx1);
currentY=2;
outlierFlag2=  isoutlier(YData(:,currentY));
oultlierIdx2=find(outlierFlag2==2);
lenOutlier2=length(oultlierIdx2);
currentY=3;
outlierFlag3=  isoutlier(YData(:,currentY));
oultlierIdx3=find(outlierFlag3==1);
lenOutlier3=length(oultlierIdx3);
currentY=4;
outlierFlag4=  isoutlier(YData(:,currentY));
oultlierIdx4=find(outlierFlag4==1);
lenOutlier4=length(oultlierIdx4);
currentY=5;
outlierFlag5=  isoutlier(YData(:,currentY));
oultlierIdx5=find(outlierFlag5==1);
lenOutlier5=length(oultlierIdx5);
ooLen=zeros(6,1);
for i=1:6
    oo=isoutlier(normalizedData(:,i));
    ooLen(i)=length(find(oo==1));
end

tt=1;