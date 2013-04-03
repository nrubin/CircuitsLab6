%figure fixer
%makes everything pretty
function SetFigureFontSizes()

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

end
