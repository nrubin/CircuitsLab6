function saveformatfig(path,filename)
% saveformatfig
%   Sets the title, axes, axes label, and legend font size of the current 
%   figure. Also saves the current figure to `path` as `filename` in EPS, 
%   PNG and FIG formats.
    fig = gcf;
    ax = gca;

    ylbl = get(ax,'ylabel');
    xlbl = get(ax,'xlabel');
    title = get(ax,'Title');
    leg = findobj(fig,'Type','axes','Tag','legend');

    set(ax,'FontSize',18);
    set(title,'FontSize',35);
    set(ylbl,'FontSize',25);
    set(xlbl,'FontSize',25);
    set(leg,'FontSize',25);

    saveas(fig, strcat(path,filename,'.eps'),'eps2c')
    saveas(fig, strcat(path,filename,'.png'))
    saveas(fig, strcat(path,filename,'.fig'))
    close(fig);
end