%Lab6Experiment3Plotter
interval = 5;

% Fit a straight line to the divider’s current transfer characteristic
% and extract the value of the divider ratio. Make a plot showing both the measured data and
% the theoretical ?t along with the extracted value of the divider ratio.

% load('Divider1Data.mat');
% Divider1_Iin = -Divider1_In;
% Divider1_Iout = Divider1_I1;
% 
% 
% 
% coeffs = polyfit(Divider1_Iin, Divider1_Iout,1);
% slope1 = coeffs(1);
% intercept1 = coeffs(2);
% Divider1_Ifit = slope1 * Divider1_Iin + intercept1;

% plot(Divider1_Iin(1:interval:end), Divider1_Iout(1:interval:end),'o','MarkerSize',20); hold on;
% plot(Divider1_Iin, Divider1_Ifit,'LineWidth',3);
% 
% title('Current Transfer Characteristic of an nMOS Current Divider with $I_{out} = \frac{4}{5}I_{in}$','interpreter','latex');
% xlabel('Input Current (A)');
% ylabel('Output Current (A)');
% legend('Data','Linear Fit with m = 0.7870','Location','SouthEast');
% 
% SetFigureFontSizes();

% Measure the output current as a function of
% input current. Once again, ?t a straight line to the divider’s current transfer characteristic
% and extract the value of the divider ratio. Make a plot showing both the measured data and
% the theoretical ?t along with the extracted value of the divider ratio
clear;
load('Divider2Data.mat');
interval = 5;
Divider2_Iout = -Divider2_I1;

coeffs = polyfit(Divider2_Iin, Divider2_Iout,1);
slope2 = coeffs(1);
intercept2 = coeffs(2);
Divider2_Ifit = slope2 * Divider2_Iin + intercept2;

plot(Divider2_Iin(1:interval:end), Divider2_Iout(1:interval:end),'o','MarkerSize',20); hold on;
plot(Divider2_Iin, Divider2_Ifit,'LineWidth',3);

title('Current Transfer Characteristic of an nMOS Current Divider with $I_{out} = \frac{4}{5}I_{in}$','interpreter','latex');
xlabel('Input Current (A)');
ylabel('Output Current (A)');
legend('Data',strcat('Linear Fit with m = ', num2str(slope2)),'Location','SouthEast');

SetFigureFontSizes();