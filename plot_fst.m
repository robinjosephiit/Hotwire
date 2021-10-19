clc;clear all;
fst_10=dlmread('profile_10.02_FST_893.txt');
fst_9=dlmread('profile_8.847_FST_893.txt');
fst_8=dlmread('profile_8.014_FST_893.txt');
fst_7=dlmread('profile_6.916_FST_893.txt');
fst_6=dlmread('profile_5.843_FST_893.txt');
fst_5=dlmread('profile_4.757_FST_893.txt');
fst_4=dlmread('profile_3.812_FST_893.txt');
fst_3=dlmread('profile_2.849_FST_893.txt');


fst_10=fst_10(2:end,:);
fst_9=fst_9(2:end,:);
fst_8=fst_8(2:end,:);
fst_7=fst_7(2:end,:);
fst_6=fst_6(2:end,:);
fst_5=fst_5(2:end,:);
fst_4=fst_4(2:end,:);
fst_3=fst_3(2:end,:);


figure(1)
hold on;set(gca,'FontSize',20);
plot(fst_3(:,1),fst_3(:,2),'-ob','linewidth',2);plot(fst_4(:,1),fst_4(:,2),'-ok','linewidth',2);
plot(fst_5(:,1),fst_5(:,2),'-or','linewidth',2);plot(fst_6(:,1),fst_6(:,2),'-og','linewidth',2);
plot(fst_7(:,1),fst_7(:,2),'-o','linewidth',2);plot(fst_8(:,1),fst_8(:,2),'-o','linewidth',2);
plot(fst_9(:,1),fst_9(:,2),'-om','linewidth',2);plot(fst_10(:,1),fst_10(:,2),'-o','linewidth',2);
legend({'893-3ms','893-4ms','893-5ms','893-6ms','893-7ms','893-8ms','893-9ms','893-10ms'},'Box','off','location','best');
xlabel('y/\delta*');ylabel('U/U_{\infty}');grid on;
xlim([0 5])

figure(2)
hold on;set(gca,'FontSize',20);
plot(fst_3(:,1),fst_3(:,3),'-ob','linewidth',2);plot(fst_4(:,1),fst_4(:,3),'-ok','linewidth',2);
plot(fst_5(:,1),fst_5(:,3),'-or','linewidth',2);plot(fst_6(:,1),fst_6(:,3),'-og','linewidth',2);
plot(fst_7(:,1),fst_7(:,3),'-o','linewidth',2);plot(fst_8(:,1),fst_8(:,3),'-o','linewidth',2);
plot(fst_9(:,1),fst_9(:,3),'-om','linewidth',2);plot(fst_10(:,1),fst_10(:,3),'-o','linewidth',2);
legend({'893-3ms','893-4ms','893-5ms','893-6ms','893-7ms','893-8ms','893-9ms','893-10ms'},'Box','off','location','best');
xlabel('y/\delta*');ylabel('u_{rms}/U_{\infty}');grid on;
xlim([0 5])

figure(3)
hold on;set(gca,'FontSize',20);
plot(fst_3(:,2),fst_3(:,3),'-ob','linewidth',2);plot(fst_4(:,2),fst_4(:,3),'-ok','linewidth',2);
plot(fst_5(:,2),fst_5(:,3),'-or','linewidth',2);plot(fst_6(:,2),fst_6(:,3),'-og','linewidth',2);
plot(fst_7(:,2),fst_7(:,3),'-o','linewidth',2);plot(fst_8(:,2),fst_8(:,3),'-o','linewidth',2);
plot(fst_9(:,2),fst_9(:,3),'-om','linewidth',2);plot(fst_10(:,2),fst_10(:,3),'-o','linewidth',2);
legend({'893-3ms','893-4ms','893-5ms','893-6ms','893-7ms','893-8ms','893-9ms','893-10ms'},'Box','off','location','best');
xlabel('U/U_{\infty}');ylabel('u_{rms}/U_{\infty}');grid on;
xlim([0 1.2])


figure(4)
hold on;set(gca,'FontSize',20);
plot(fst_3(:,2),fst_3(:,4),'-ob','linewidth',2);plot(fst_4(:,2),fst_4(:,4),'-ok','linewidth',2);
plot(fst_5(:,2),fst_5(:,4),'-or','linewidth',2);plot(fst_6(:,2),fst_6(:,4),'-og','linewidth',2);
plot(fst_7(:,2),fst_7(:,4),'-o','linewidth',2);plot(fst_8(:,2),fst_8(:,4),'-o','linewidth',2);
plot(fst_9(:,2),fst_9(:,4),'-om','linewidth',2);plot(fst_10(:,2),fst_10(:,4),'-o','linewidth',2);
legend({'893-3ms','893-4ms','893-5ms','893-6ms','893-7ms','893-8ms','893-9ms','893-10ms'},'Box','off','location','best');
xlabel('U/U_{\infty}');ylabel('u_{rms,+ve}/U_{\infty}');grid on;
xlim([0 1.2])

figure(5)
hold on;set(gca,'FontSize',20);
plot(fst_3(:,2),fst_3(:,5),'-ob','linewidth',2);plot(fst_4(:,2),fst_4(:,5),'-ok','linewidth',2);
plot(fst_5(:,2),fst_5(:,5),'-or','linewidth',2);plot(fst_6(:,2),fst_6(:,5),'-og','linewidth',2);
plot(fst_7(:,2),fst_7(:,5),'-o','linewidth',2);plot(fst_8(:,2),fst_8(:,5),'-o','linewidth',2);
plot(fst_9(:,2),fst_9(:,5),'-om','linewidth',2);plot(fst_10(:,2),fst_10(:,5),'-o','linewidth',2);
legend({'893-3ms','893-4ms','893-5ms','893-6ms','893-7ms','893-8ms','893-9ms','893-10ms'},'Box','off','location','best');
xlabel('U/U_{\infty}');ylabel('u_{rms,-ve}/U_{\infty}');grid on;
xlim([0 1.2])
