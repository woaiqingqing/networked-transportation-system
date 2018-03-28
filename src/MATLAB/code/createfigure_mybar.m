function createfigure1(ymatrix1)
%CREATEFIGURE1(YMATRIX1)
%  YMATRIX1:  bar matrix data

%  Auto-generated by MATLAB on 26-Sep-2016 20:31:19

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1,'LineWidth',2,'XTickLabel',{'Q-BMW','W-BMW'},...
    'XTick',[1 2],...
    'FontSize',18);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'on');

% Create multiple lines using matrix input to bar
bar1 = bar(ymatrix1,...
    'EdgeColor',[0.0784313725490196 0.168627450980392 0.549019607843137],...
    'BarWidth',1,...
    'Parent',axes1);
set(bar1(1),'DisplayName','Queue 1',...
    'FaceColor',[1 0.219607843137255 0.36078431372549]);
set(bar1(2),'DisplayName','Queue 2','FaceColor',[1 0.2 1]);
set(bar1(3),'DisplayName','Queue 3','FaceColor',[0 0.400000005960464 1]);
set(bar1(4),'DisplayName','Queue 4',...
    'FaceColor',[0.200000002980232 0.800000011920929 0]);

% Create ylabel
ylabel({'Per-Queue Average Delay'});

% Create legend
legend(axes1,'show');

