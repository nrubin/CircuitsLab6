%Experiment 1 plotter

load('GateCharacteristic1.mat')
load('GateCharacteristic2.mat')
load('GateCharacteristic3.mat')
load('GateCharacteristic4.mat')
ChannelCurrent1 = -ChannelCurrent1;
ChannelCurrent2 = -ChannelCurrent2;
ChannelCurrent3 = -ChannelCurrent3;
ChannelCurrent4 = -ChannelCurrent4;

interval = 10;

% Fit the EKV model to each of these characteristics and extract a value of Is
% , ?, and V T0.

% Make a single semilog plot for your report showing all four current–voltage characteristics along
% with the ?ts.

[Is1, VT1, kappa1] = ekvfit(GateVoltage1,ChannelCurrent1,5e-4);
Ifit1 = Is1 * (log(1 + exp(kappa1*(GateVoltage1 - VT1)/(2*0.0258)))).^2;

[Is2, VT2, kappa2] = ekvfit(GateVoltage2,ChannelCurrent2,5e-4);
Ifit2 = Is2 * (log(1 + exp(kappa2*(GateVoltage2 - VT2)/(2*0.0258)))).^2;

[Is3, VT3, kappa3] = ekvfit(GateVoltage3,ChannelCurrent3,5e-4);
Ifit3 = Is3 * (log(1 + exp(kappa3*(GateVoltage3 - VT3)/(2*0.0258)))).^2;

[Is4, VT4, kappa4] = ekvfit(GateVoltage4,ChannelCurrent4,5e-4);
Ifit4 = Is4 * (log(1 + exp(kappa4*(GateVoltage4 - VT4)/(2*0.0258)))).^2;

newfigure();
screen_size = get(0, 'ScreenSize');
set(gcf, 'Position', [0 0 screen_size(3) screen_size(4) ] ); %set to scren size
set(gcf,'PaperPositionMode','auto') %set paper pos for printing

semilogy(GateVoltage1(1:interval:end),ChannelCurrent1(1:interval:end),'.k','MarkerSize',15); hold on;
semilogy(GateVoltage1,Ifit1,'-k','LineWidth',2,'LineSmoothing','on');

semilogy(GateVoltage2(1:interval+1:end),ChannelCurrent2(1:interval+1:end),'or','MarkerSize',15); 
semilogy(GateVoltage2,Ifit2,'-r','LineWidth',2,'LineSmoothing','on');

semilogy(GateVoltage3(1:interval-1:end),ChannelCurrent3(1:interval-1:end),'*g','MarkerSize',15); 
semilogy(GateVoltage3,Ifit3,'-g','LineWidth',2,'LineSmoothing','on');

semilogy(GateVoltage4(1:interval+2:end),ChannelCurrent4(1:interval+2:end),'bx','MarkerSize',15); 
semilogy(GateVoltage4,Ifit4,'-b','LineWidth',2,'LineSmoothing','on');

ylim([1e-9 1e-2]);

title('Current-Voltage Characteristics of Four Matched nMOS Transistors');
xlabel('Gate Voltage (V)');
ylabel('Channel Current (A)');
legend('Transistor 1 Data','Transistor 1 EKV Fit',...
'Transistor 2 Data','Transistor 2 EKV Fit',...
'Transistor 3 Data','Transistor 3 EKV Fit',...
'Transistor 4 Data','Transistor 4 EKV Fit','Location','SouthEast');

saveformatfig('./Figures/','Experiment1Figure1');

% Also, make a semilog (i.e., make the x-axis log) plot showing the percentage
% di?erence between each transistor’s channel current and the mean value of all four channel
% currents as a function of the mean value of all four channel currents.

meanCurrent = (ChannelCurrent1 + ChannelCurrent2 + ChannelCurrent3 + ChannelCurrent4)./4;
diff1 = (ChannelCurrent1 - meanCurrent)./meanCurrent*100;
diff2 = (ChannelCurrent2 - meanCurrent)./meanCurrent*100;
diff3 = (ChannelCurrent3 - meanCurrent)./meanCurrent*100;
diff4 = (ChannelCurrent4 - meanCurrent)./meanCurrent*100;
newfigure()
screen_size = get(0, 'ScreenSize');
set(gcf, 'Position', [0 0 screen_size(3) screen_size(4) ] ); %set to scren size
set(gcf,'PaperPositionMode','auto') %set paper pos for printing
semilogx(meanCurrent,diff1,'.k','MarkerSize',15); hold on;
semilogx(meanCurrent,diff2,'*r','MarkerSize',15); hold on;
semilogx(meanCurrent,diff3,'og','MarkerSize',15); hold on;
semilogx(meanCurrent,diff4,'xb','MarkerSize',15); hold on;

ylim([-6 8])

title({'Percent Deviation from Mean Current as a' ; 'Function of Mean Current for Four nMOS Transistors'});
xlabel('Mean Current (A)');
ylabel('Deviation (%)');
legend('Transistor 1 Deviation',...
'Transistor 2 Deviation',...
'Transistor 3 Deviation',...
'Transistor 4 Deviation','Location','SouthEast');

saveformatfig('./Figures/','Experiment1Figure2');


