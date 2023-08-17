function plotHistogram (x,xName)
%load('D:\My Papers\Dr Feridoni\Code\data\data.mat')
%plotHistogram (XData(:,1),'\Gamma_n')
close all;
% histfit(x,ceil(1+log(length(x))));
histfit(x,7);
mn = mean(x);    %%%Calculate the mean
stdv = std(x);     %%%Calculate the standard deviation
mnlabel = sprintf('Mean = %.2f', mn);
stdlabel = sprintf('Std Dev. = %.2f', stdv);
nLabel = sprintf('N = %3.2d', length(x));
h = annotation('textbox',[0.13 0.8 0.1 0.1],'linestyle','none','FitBoxToText','on');
set(h,'String',{mnlabel,stdlabel,nLabel});
set(h, 'FontSize', 15,'fontName','Times New Roman')
xlabel(xName,'FontSize',16,'fontName','Times New Roman')
% h = xlabel(text,'FontSize',30);
% get(h)
ylabel('Frequency','FontSize',16,'fontName','Times New Roman');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times New Roman','fontsize',14)
a = get(gca,'yTickLabel');
set(gca,'yTickLabel',a,'FontName','Times New Roman','fontsize',14)
set(gca,'TickDir','out'); 

end