% % B1
% model_series = [7.0408 7.9494 6.3796 6.4077	6.7485	7.8114	10.0130];
% model_error = [1.3734 1.4088 1.2353 1.2530 0.3218 1.4264 1.5035];
% % B2
% model_series = [0.0018	0.0018	0.0017	0.0016	0.0017	0.0020	0.0022];
% model_error = [0.1828	0.1834	0.1764	0.1740	0.1748	0.1845	0.1883];
function plotErrorBar(strTitle,model_series,model_error)
    
    X = categorical({'REG-LIN','REG-EXP','SVM-LIN','SVM-POL', 'SVM-RBF', 'RTE', 'GENFIS'});
    X=reordercats(X,{'REG-LIN','REG-EXP','SVM-LIN','SVM-POL', 'SVM-RBF', 'RTE', 'GENFIS'});
    b = bar(X,model_series);
    b.FaceColor = 'flat';
    b.CData(1,:) = [0 0 1];
    b.CData(2,:) = [.5 0.5 .5];
    b.CData(3,:) = [0.9 0 0];
    b.CData(4,:) = [0 0.9 0];
    b.CData(5,:) = [.5 0.7 .5];
    b.CData(6,:) = [.5 0.4 .5];
    b.CData(7,:) = [0.8 0.5 .5];
    % set(b, 'Interpreter', 'none')
    hold on
    % Calculate the number of groups and number of bars in each group
    % [ngroups,nbars] = size(model_series);
    % Get the x coordinate of the bars
    % x = nan(nbars, ngroups);
    % for i = 1:nbars
    %     x(i,:) = b(i).XEndPoints;
    % end
    % Plot the errorbarseftt5r
    title(strTitle, 'Interpreter','tex','fontName','Times');
    x=1:1:7;
    errorbar(x,model_series,model_error,'k','linestyle','none');
    hold off
end