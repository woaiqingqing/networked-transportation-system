function createfigure3(X1, YMatrix1)
%CREATEFIGURE(X1, YMATRIX1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 01-Oct-2015 12:18:49

% Create figure
figure1 = figure('Color',[1 1 1], 'Position', [100 300 700 450]);

% Create axes
axes1 = axes('Parent',figure1,'LineWidth',4,'GridColor',[0 0 0],...
    'FontWeight','bold',...
    'FontSize',20);
grid(axes1,'on');
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'LineWidth',6);
set(plot1(1),'DisplayName','Client 1');
set(plot1(2),'DisplayName','Client 2');
set(plot1(3),'DisplayName','Client 3');
%set(plot1(4),'DisplayName','Client 4');
% Create xlabel
xlabel({'Time (slots)'});

% Create ylabel
ylabel({'Mean Inter-Service Time'});

% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.720833335523204 0.424489949712541 0.120777024837161 0.127819545398977]);

