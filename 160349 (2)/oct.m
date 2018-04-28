#step1

data = dlmread('train.csv',',',1,0);
x_train = data(:,1);
y_train = data(:,2);
i = ones(rows(x_train),1);
x_train = [i, x_train];


#step2

w = rand(2,1);


#step3


feature = data(:,1);

hold on;
plot(y_train,feature);
#scatter (y_train,feature, "r");
ylabel ("Y");
xlabel ("X");
#title ("scatter() plot with red bubbles");
#print -dpdf "fig1.pdf";

WT = w.';

z = (WT * x_train.');
hold on;
plot(z, feature);

ylabel ("W^T * x_train");
xlabel ("feature");
#title ("Graph for f(x) = x^3");

print -dpdf "step3.pdf";
close;







#step4
a = inv((x_train.')*(x_train));
w_direct = a*((x_train.')*(y_train));

hold on;
plot(y_train,feature, "^b");
#scatter (feature,y_train, "r");
ylabel ("Y");
xlabel ("X");
#title ("scatter() plot with red bubbles");
#print -dpdf "fig2.pdf";


hold on;
plot(w_direct, feature);

ylabel ("w_direct");
xlabel ("feature");
#title ("Graph for f(x) = x^3");

print -dpdf "step4.pdf";
close;





#step5

for i=1:2
for j = 1 : 10000
	x1 = [1 , data(j,1)];
	x9 = x1.';
	w1 = (((w.') * x9)- data(j,2))* x9;
	w = w - 0.00000001 * w1;
	if(j%100==0)
		hold on;
		plot(y_train,feature);
		#scatter (y_train,feature, "r");
		ylabel ("Y");
		xlabel ("X");
		
		wt=w.';
		wt= wt * x9;
		hold on;
		plot(wt, data(j,1));

		ylabel ("W^T * x'");
		xlabel ("feature");


		print -dpdf "step5.pdf";
		close;
	endif;
end
end




#step6






#step7

#w = rand(2,1);

test = dlmread('test.csv',',',1,0);
x_test = test(:,1);
y_test = test(:,2);
i = ones(rows(x_test),1);
x_test = [i, x_test];

#a = inv((x_train.')*(x_train));
#w_direct = a*((x_train.')*(y_train));

y_pred1 = x_test * w;
y_e1 = y_pred1 - y_test;
y_e1 = y_e1.^2;
y_e1 = mean(y_e1);
y_e1 = y_e1.^(0.5)
y_pred2 = x_test * w_direct;
y_e2 = y_pred2 - y_test;
y_e2 = y_e2.^2;
y_e2 = mean(y_e2);
y_e2 = y_e2.^(0.5)

