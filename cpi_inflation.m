[CPI,Inflation_date,~]=xlsread('CPI_2015.xlsx','데이터','A6:B229'); %1965 I ~ 2020 IV
% file name, which sheet to read, range
%% A6 to B229 here
% to text, not to number
% [number you get, text]
%% turn all number it recognizes as first output, all the text as second
[GDP,GDP_date,~]=xlsread('GDP_growth_rate_yoy_sa.xlsx','데이터','A6:B248'); %1960 II ~ 2020 IV
[ITR,Interest_date,~]=xlsread('CD91days_GovBond3yr.xlsx','데이터','A21:C140'); %1901 II ~ 2020 IV

% work with interest rate
% take log difference
IFR = (log(CPI(5:end,1))-log(CPI(1:end-4,1)))*100
% ignoring first 4 observations of 1st year

%plot
figure(1)
% tell matlab, specify
plot((1:243)',GDP)
% horizontally equally plotted spots, column containing 1-243 as x
% change around line specification
plot((1:243)',GDP,'-k')
% '-k': black color
% '*': star dots
% '-*': line + star dots

% interest rate along GDP data
% GDP: start from 1991.1
plot((1:243)',GDP,'-k',(124:243)',ITR(:,1),'-r')
%(:,1): all rows from 1 to last, 1st column
% start from 1991 and 1960 

% add inflation rate
plot((1:243)',GDP,'-k',(124:243)',ITR(:,1),'-r',(24:243)',IFR,'-')
% from row 24


xticks(3:20:243)
% start from 3 to 243 and plot every 20
xticklabels({'60.IV','65.IV','75.IV','80.IV','85.IV','90.IV','95.IV','00.IV','05.IV','10.IV','15.IV','20.IV',})
axis([1,243,-10,30])
% specify range for x and y
% x from 1 to 243, y from -10 to 30
legend('GDP growth rate','CD 91 days','inflation')
% legend on the top
xlabel('Yr.Quarter')
ylabel('%')
title('KR macro variables')

% 2 graphs on the same row
% split into 2 by 1 
subplot(2,1,2)
axis([1,243,-10,30])
xlabel('1')
ylabel('2')
title('practice')



