[CPI,Inflation_date,~]=xlsread('CPI_2015.xlsx','데이터','A6:B229'); %1965 I ~ 2020 IV
[GDP,GDP_date,~]=xlsread('GDP_growth_rate_yoy_sa.xlsx','데이터','A6:B248'); %1960 II ~ 2020 IV
[ITR,Interest_date,~]=xlsread('CD91days_GovBond3yr.xlsx','데이터','A21:C140'); %1901 II ~ 2020 IV

% use data after 1991
GR=GDP(124:243,1);
CD=ITR(:,1)
% all row and 1st column
IFR=IFR(101:220,1);

figure(3)
subplot(2,2,1)
scatter(GR,CD)
xlabel('Growth rate')
ylabel('CD91days')
axis([-5 25 -5 25])

subplot(2,2,2)
scatter(GR,IFR)
xlabel('Growth rate')
ylabel('inflation rate')
axis([-5 25 -5 25])

subplot(2,2,3)
scatter(GR,IFR)
xlabel('CD91days')
ylabel('inflation rate')
axis([-5 25 -5 25])

figure(4)
subplot(2,2,1)
% 45 degree line
scatter(GR(1:end-1,1),GR(2:end,1))
xlabel('previous')
ylabel('current')
axis([-5 10 -5 10])

subplot(2,2,2)
scatter(IFR(1:end-1,1),GR(2:end,1))
xlabel('previous')
ylabel('current')
axis([-5 15 -5 15])

subplot(2,2,3)
scatter(CD(1:end-1,1),GR(2:end,1))
xlabel('previous')
ylabel('current')
axis([-5 25 -5 25])
% inflation: + correlation
% autocorrelation: 