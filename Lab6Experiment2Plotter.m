%Experiment 1 plotter
clear; clf;
close all;

interval = 10;

load('SinglenMOSCharaceristics.mat');
load('SeriesnMOSCharacteristic.mat');
load('ParallelnMOSCharacteristic.mat');


%%%Plot Individual Currents
figure(1);
screen_size = get(0, 'ScreenSize');
set(gcf, 'Position', [0 0 screen_size(3) screen_size(4) ] ); %set to scren size
set(gcf,'PaperPositionMode','auto') %set paper pos for printing

semilogy(Single_nMOS_Ohmic_GateVoltage(1:interval:end),Single_nMOS_Ohmic_ChannelCurrent(1:interval:end) ,'.r','MarkerSize',15); hold on;
semilogy(Single_nMOS_Sat_GateVoltage(1:interval:end),Single_nMOS_Sat_ChannelCurrent(1:interval:end),'or','MarkerSize',15); hold on;

semilogy(Series_nMOS_Ohmic_GateVoltage(4:interval:end),Series_nMOS_Ohmic_ChannelCurrent(4:interval:end) ,'.b','MarkerSize',15); hold on;
semilogy(Series_nMOS_Sat_GateVoltage(4:interval:end),Series_nMOS_Sat_ChannelCurrent(4:interval:end),'ob','MarkerSize',15); hold on;

semilogy(Parallel_nMOS_Ohmic_GateVoltage(1:interval:end),Parallel_nMOS_Ohmic_ChannelCurrent(1:interval:end) ,'.g','MarkerSize',15); hold on;
semilogy(Parallel_nMOS_Sat_GateVoltage(1:interval:end),Parallel_nMOS_Sat_ChannelCurrent(1:interval:end),'og','MarkerSize',15); hold on;

%%%Set Plot Labels and legends for Figure 1
title({'Channel Current As A ' ; 'Function of Gate Voltage for Series and Parallel Combinations'});
xlabel('Gate Voltage (V)');
ylabel('Channel Current (A)');
legend('Single nMOS in ohmic',...
'Single nMOS in saturation',...
'Two series nMOS in ohmic',...
'Two series nMOS in saturation',...
'Two parallel nMOS in ohmic',...
'Two parallel nMOS in Saturation', 'Location','SouthEast');
SetFigureFontSizes();

%%%Save Figure 1
saveas(gcf,'./Figures/Experiment2Currents.eps', 'eps2c')
saveas(gcf,'./Figures/Experiment2Currents.fig')
saveas(gcf,'./Figures/Experiment2Currents.png')


%%% Calculate ratio for each current relative to single nMOS
series_single_ohmic = (Series_nMOS_Ohmic_ChannelCurrent./Single_nMOS_Ohmic_ChannelCurrent);
series_single_sat   = (Series_nMOS_Sat_ChannelCurrent./Single_nMOS_Sat_ChannelCurrent);

paralell_single_ohmic = (Parallel_nMOS_Ohmic_ChannelCurrent./Single_nMOS_Ohmic_ChannelCurrent);
paralell_single_sat   = (Parallel_nMOS_Sat_ChannelCurrent./Single_nMOS_Sat_ChannelCurrent);



figure(2);
screen_size = get(0, 'ScreenSize');
set(gcf, 'Position', [0 0 screen_size(3) screen_size(4) ] ); %set to scren size
set(gcf,'PaperPositionMode','auto') %set paper pos for printing
plot(Series_nMOS_Ohmic_GateVoltage(1:interval:end), series_single_ohmic(1:interval:end), 'r.','MarkerSize',15); hold on;
plot(Series_nMOS_Sat_GateVoltage(1:interval:end), series_single_sat(1:interval:end), 'bo','MarkerSize',15); hold on;

plot(Parallel_nMOS_Ohmic_GateVoltage(1:interval:end), paralell_single_ohmic(1:interval:end), 'b.','MarkerSize',15); hold on;
plot(Parallel_nMOS_Sat_GateVoltage(1:interval:end), paralell_single_sat(1:interval:end), 'ro','MarkerSize',15); hold on;

%%%Set Plot Labels and legends for Figure 2
ylim([-1,3]);
title({'Ratio of currents' ; 'for Series and Parallel Combinations of nMOS, to single nMOS'});
xlabel('Gate Voltage (V)');
ylabel('Ratio');
legend('Series ratio to single nMOS in ohmic',...
'Series ratio to single nMOS in saturation',...
'Parallel ratio to single nMOS in ohmic',...
'Parallel ratio to single nMOS in Saturation', 'Location','SouthEast');
SetFigureFontSizes();

%%%Save Figure 2
saveas(gcf,'./Figures/Experiment2Ratios.eps', 'eps2c')
saveas(gcf,'./Figures/Experiment2Ratios.fig')
saveas(gcf,'./Figures/Experiment2Ratios.png')