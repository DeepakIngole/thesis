function plotIdentTemp(ValveAndTemp)
hManipulated=subplot(2,1,1);
set(hManipulated, 'OuterPosition', [0,0.67, 1, .33]);

plot(ValveAndTemp.time,ValveAndTemp.signals(2).values(:,1),...
     ValveAndTemp.time, ValveAndTemp.signals(2).values(:,2))
% set limit
lim=get(gca,'YLim');
lim(1)=-0.1;
lim(2)=1.1;
set(gca,'YLim',lim);

%set X axes label
plotting_axesLabel_Days()

legend('Radi�tor szelep','Padl�f�t�s szelep')
subtitle=get(hManipulated,'Title');
subtitle.String='Beavatkoz� jelek';
shg %show it

% leg=get(gca, 'Legend');
% leg.String(1)={'RadiatorValve'};
% leg.String(2)={'FloorValve'};

%% plot2
hMeasured=subplot(2,1,2);
set(hMeasured, 'OuterPosition', [0,0, 1, .6]);

%plot(ValveAndTemp.time,[ValveAndTemp.signals(1).values(:,1:1:2) ValveAndTemp.signals(1).values(:,3)-273])

plot(ValveAndTemp.time, ValveAndTemp.signals(1).values(:,1),'k-',...
     ValveAndTemp.time, ValveAndTemp.signals(1).values(:,2),'r-',...
     ValveAndTemp.time, ValveAndTemp.signals(1).values(:,3)-273,'g-',...
     ValveAndTemp.time, ValveAndTemp.signals(1).values(:,4)-273,'c-')

lim=get(gca,'YLim');
lim(1)=-25;
lim(2)=50;
set(gca,'YLim',lim);
% lab=get(gca,'YTickLabel');
% lab{11}='';
% lab{12}='';
% set(gca,'YTickLabel',lab);
%hMeasured.YTickLabel{12}='';


%set X axes label
plotting_axesLabel_Days()
legend('K�ls� h�m�rs�klet t_e','Helyis�g h�m�rs�klete t_i','Nemline�ris modell t_i','Lineariz�lt modell t_i')
leg=get(gca, 'Legend');
leg.Position =[0.6200    0.58    0.2927    0.0822];
subtitle=get(hMeasured,'Title');
subtitle.String='M�rt v�ltoz�k';

shg %show it

%% Misc

function plotting_axesLabel_Days()
%mintav�teli id� 1800s=1 egys�g=f�l �ra. A struct time-ban adja.
% Simulink: 3600*24*10*75 mp, azaz 
set(gca,'XTick',0:30*24*3600:3600*24*7*120)
set(gca,'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10','11'});%,'13','14','15','16'})
xlab=get(gca,'XLabel');
xlab.String='id� (h�nap)';
set(gca,'XLabel',xlab)