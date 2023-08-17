function plotErrorBar(m,stdev,currentOutput, strTitle)
set(0, 'DefaultTextInterpreter', 'tex')
errorbar(1:39,m,stdev,"MarkerEdgeColor","blue","MarkerFaceColor",[0.65 0.85 0.90],"LineStyle","none","marker","o")
hold on
xlabel('Sample No.');
set(0,'DefaultAxesTitleFontWeight','normal');
set(gca,'TickDir','out');
set(gca,'XColor','k');
set(gca,'YColor','k');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times');
ylabel(strcat(currentOutput, ' (predicted)'));
title(strTitle, 'Interpreter','none','fontName','Times');
%hold off

