function plotScatterPlot(x,y,r2, strTitle,currentOutput)
set(0,'DefaultAxesTitleFontWeight','normal');
figure;
plot(x,y,'ob');
title(strTitle, 'Interpreter','none','fontName','Times');
hold on; 
yEqualX=linspace(min(x),max(x),50);
plot(yEqualX,yEqualX,'k.');
Fit = polyfit(x,y,1); % x = x data, y = y data, 1 = order of the polynomial i.e a straight line
% plot(polyval(Fit,x,'-'))
f=polyval(Fit,x);
plot(x,f,'-r','LineWidth',2)
theString = sprintf('Y = %.3f X + %.3f', Fit(1), Fit(2));
legend('Data Points','Y=X','Best Linear Fit', 'Location','southeast','fontName','Times');
%xlabel(strcat( currentOutput(1),'_',currentOutput(2),'(observed)'),'fontName','Times');
xlabel(currentOutput);
%ylabel(strcat( currentOutput(1),'_',currentOutput(2),'(predicted)'),'fontName','Times');
ylabel(currentOutput);
% axes=plt. gca() ;
% [ymin, ymax] = axes.get_ylim();
ylimit=ylim;
% text(1,ylimit(2)-1,strcat('R^2= ',num2str(r2,4)), ...
% 'fontName','Times');%%B1
% text(0.565,ylimit(2)-0.03,strcat('R^2= ',num2str(r2,4)), ...
% 'fontName','Times');%B2
% text(10,ylimit(2)-20,strcat('R^2= ',num2str(r2,4)), ...
% 'fontName','Times');%B3
% text(5,ylimit(2)-10,strcat('R^2= ',num2str(r2,4)), ...
% 'fontName','Times');%B4
% text(0.565,ylimit(2)-0.06,theString,'fontName','Times');%B2
text(1,ylimit(2)-1,strcat('R^2= ',num2str(r2,4)), ...
'fontName','Times');%B5
% text(1,ylimit(2)-3,theString,'fontName','Times');%%B1
% text(10,ylimit(2)-60,theString,'fontName','Times');%B3 
% text(5,ylimit(2)-20,theString,'fontName','Times');%B4
text(1,ylimit(2)-3,theString,'fontName','Times');
set(gca,'TickDir','out');
set(gca,'XColor','k');
set(gca,'YColor','k');
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times');

hold off
end