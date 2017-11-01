function createfigure_subplot(X1, YMatrix1, YMatrix2, YMatrix3)
%CREATEFIGURE1(X1, YMATRIX1, YMATRIX2, YMATRIX3)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%  YMATRIX2:  matrix of y data

%  Auto-generated by MATLAB on 28-Mar-2016 14:58:46

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create subplot
subplot1 = subplot(3,1,1,'Parent',figure1,'LineWidth',2,'FontSize',16);
box(subplot1,'on');
grid(subplot1,'on');
hold(subplot1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'Parent',subplot1,'LineWidth',2);
set(plot1(1),'DisplayName','C1','Color',[0 0 1]);

% Create xlabel
xlabel({'Time'});

% Create ylabel
ylabel({'Queue length'});

% Create legend
legend1 = legend(subplot1,'show');
set(legend1,...
    'Position',[0.772545439742077 0.795737880890614 0.14235500747793 0.134292562373822]);

% Create axes
axes1 = axes('Parent',figure1,'LineWidth',2,'FontSize',16,...
    'Position',[0.13 0.143976438687868 0.775 0.307186352009806]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot2 = plot(X1,YMatrix2,'Parent',axes1,'LineWidth',2);
set(plot2(1),'DisplayName','C2','Color',[1 0 0]);

% Create xlabel
xlabel({'Time'});

% Create ylabel
ylabel({'Queue Length'});

% Create legend
legend2 = legend(axes1,'show');
set(legend2,...
    'Position',[0.772962433801454 0.324106675216856 0.14235500747793 0.134292562373822]);


% Create multiple lines using matrix input to plot
plot3 = plot(X1,YMatrix3,'Parent',axes1,'LineWidth',2);
set(plot3(1),'DisplayName','C3','Color',[1 0 0]);

% Create xlabel
xlabel({'Time'});

% Create ylabel
ylabel({'Queue Length'});

% Create legend
legend3 = legend(axes1,'show');
set(legend3,...
    'Position',[0.772962433801454 0.124106675216856 0.14235500747793 0.134292562373822]);

