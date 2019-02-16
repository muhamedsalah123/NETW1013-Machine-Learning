clear all;
close all;
clc;
ds = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(ds);
price=T{:,3};
sqftlot=T{:,7};
sqftliving = T{:,6};
sqftliving15 = T{:,20};
sqftlot15 = T{:,21};
pricenormalized=featureNormalize(price);
sqftlotnormalized=featureNormalize(sqftlot);
sqftlivingnormalized=featureNormalize(sqftliving);
sqftlot15normalized=featureNormalize(sqftlot15);
sqftliving15normalized=featureNormalize(sqftliving15);
h=0.1524*sqftlotnormalized-0.01318;
h2=0.7904*sqftlivingnormalized-0.00817;
h3=0.7235*sqftliving15normalized-0.009205;
h4=0.1662*sqftlot15normalized-0.01315;
plot(pricenormalized,sqftlotnormalized,'d')
figure()
plot(h,pricenormalized,'d')
computeCost(h,pricenormalized,1)
theta = zeros(3, 1)
gradientDescent(sqftlotnormalized,pricenormalized,0.1524,0.05,400)