function myPlotSurfFrom4Dim(xDim, yDim, zDim,foldIdx,epsilonIdx, bestC, bestGamma, bestz,stepX, stepY)
zValues=zeros(length(xDim),length(yDim));
for i=1:length(xDim)
    for j=1:length(yDim)
        zValues(i,j)=zDim(foldIdx,i,epsilonIdx,j);
    end
end
y=min(yDim):stepY:max(yDim);
x=min(xDim):stepX:max(xDim);
x=log2(x);
y=log2(y);
[xDDim,yDDim]=meshgrid(x,y);
set(0,'DefaultAxesTitleFontWeight','normal');
if size(xDDim)==size(yDDim)
s=surf(xDDim,yDDim,zValues');
s.EdgeColor = 'none';
colorbar;
title({
    [strcat('Best log_2 C = ',num2str(log2(bestC),3)) ] 
    [strcat('Best log_2 \gamma = ',num2str(log2(bestGamma),3)) ] 
    [strcat('MSE_{opt} = ',num2str(bestz,4))]
    },'fontName','Times');
% title(strcat('Best log_2 C = ',num2str(log(bestC),3),'\nBest log_2 \gamma = ',num2str(log(bestGamma),4), '\nMSE_opt = ',num2str(bestz,4)),'fontName','Times');
xlabel(strcat('Log_2 C'),'fontName','Times');
ylabel(strcat('Log_2 \gamma'),'fontName','Times');
% switch foldIdx
%     case 1
%            zlabelstr='1^{st}';
%     case 2
%         zlabelstr='2^{nd}';
%     case 3
%         zlabelstr='3^{nd}';
% end
zlabel('MSE','fontName','Times');
% annotation('textbox',[.05 .7 .9 .8],'String',zlabelstr,'EdgeColor','none')
 a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times');
a = get(gca,'YTickLabel');
set(gca,'XTickLabel',a,'FontName','Times');
a = get(gca,'ZTickLabel');
set(gca,'XTickLabel',a,'FontName','Times');
else
    error='Dimensionality inCompatible';
end
