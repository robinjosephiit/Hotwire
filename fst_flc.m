clc;clear all;
fst_3=dlmread('uflc_2.8491_FST_893.txt');
fst_4=dlmread('uflc_3.8124_FST_893.txt');
fst_5=dlmread('uflc_4.7578_FST_893.txt');
fst_6=dlmread('uflc_5.8431_FST_893.txt');
fst_7=dlmread('uflc_6.9167_FST_893.txt');
fst_8=dlmread('uflc_8.0143_FST_893.txt');
fst_9=dlmread('uflc_8.8476_FST_893.txt');
fst_10=dlmread('uflc_10.024_FST_893.txt');

%% 

figure(1)
suptitle('u-{wall}-893mm; fst');
set(gca,'FontSize',20);
subplot(4,2,1);plot(fst_3(:,1),fst_3(:,3));xlim([0 1]);ylim([-5 5]);legend({'3 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,2);plot(fst_4(:,1),fst_4(:,3));xlim([0 1]);ylim([-5 5]);legend({'4 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,3);plot(fst_5(:,1),fst_5(:,3));xlim([0 1]);ylim([-5 5]);legend({'5 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,4);plot(fst_6(:,1),fst_6(:,3));xlim([0 1]);ylim([-5 5]);legend({'6 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,5);plot(fst_7(:,1),fst_7(:,3));xlim([0 1]);ylim([-5 5]);legend({'7 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,6);plot(fst_8(:,1),fst_8(:,3));xlim([0 1]);ylim([-5 5]);legend({'8 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,7);plot(fst_9(:,1),fst_9(:,3));xlim([0 1]);ylim([-5 5]);legend({'9 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,8);plot(fst_10(:,1),fst_10(:,3));xlim([0 1]);ylim([-5 5]);legend({'10 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);%% 

figure(2)
suptitle('u-{rms,max}-893mm; fst');
set(gca,'FontSize',20);
subplot(4,2,1);plot(fst_3(:,1),fst_3(:,2));xlim([0 1]);ylim([-5 5]);legend({'3 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,2);plot(fst_4(:,1),fst_4(:,2));xlim([0 1]);ylim([-5 5]);legend({'4 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,3);plot(fst_5(:,1),fst_5(:,2));xlim([0 1]);ylim([-5 5]);legend({'5 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,4);plot(fst_6(:,1),fst_6(:,2));xlim([0 1]);ylim([-5 5]);legend({'6 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,5);plot(fst_7(:,1),fst_7(:,2));xlim([0 1]);ylim([-5 5]);legend({'7 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,6);plot(fst_8(:,1),fst_8(:,2));xlim([0 1]);ylim([-5 5]);legend({'8 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,7);plot(fst_9(:,1),fst_9(:,2));xlim([0 1]);ylim([-5 5]);legend({'9 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,8);plot(fst_10(:,1),fst_10(:,2));xlim([0 1]);ylim([-5 5]);legend({'10 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);%% 

figure(3)
suptitle('u-{fs}-893mm; fst');
set(gca,'FontSize',20);
subplot(4,2,1);plot(fst_3(:,1),fst_3(:,4));xlim([0 1]);ylim([-5 5]);legend({'3 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,2);plot(fst_4(:,1),fst_4(:,4));xlim([0 1]);ylim([-5 5]);legend({'4 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,3);plot(fst_5(:,1),fst_5(:,4));xlim([0 1]);ylim([-5 5]);legend({'5 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,4);plot(fst_6(:,1),fst_6(:,4));xlim([0 1]);ylim([-5 5]);legend({'6 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,5);plot(fst_7(:,1),fst_7(:,4));xlim([0 1]);ylim([-5 5]);legend({'7 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,6);plot(fst_8(:,1),fst_8(:,4));xlim([0 1]);ylim([-5 5]);legend({'8 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,7);plot(fst_9(:,1),fst_9(:,4));xlim([0 1]);ylim([-5 5]);legend({'9 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);
subplot(4,2,8);plot(fst_10(:,1),fst_10(:,4));xlim([0 1]);ylim([-5 5]);legend({'10 m/s'},'Box','off','Location','best');set(gca,'FontSize',15);%% 


%% 


%Spectra calc
[a,b]=size(fst_3);
pow2=fix(log2(a));
Nfft=2^(pow2-5);
SR=20000;


[fst_3_pmax,fst_3_fmax]=pwelch(fst_3(:,2),hann((Nfft/8)),[],Nfft,SR);
[fst_3_pwall,fst_3_fwall]=pwelch(fst_3(:,3),hann((Nfft/8)),[],Nfft,SR);
[fst_3_pfs,fst_3_ffs]=pwelch(fst_3(:,4),hann((Nfft/8)),[],Nfft,SR);

[fst_4_pmax,fst_4_fmax]=pwelch(fst_4(:,2),hann((Nfft/8)),[],Nfft,SR);
[fst_4_pwall,fst_4_fwall]=pwelch(fst_4(:,3),hann((Nfft/8)),[],Nfft,SR);
[fst_4_pfs,fst_4_ffs]=pwelch(fst_4(:,4),hann((Nfft/8)),[],Nfft,SR);


[fst_5_pmax,fst_5_fmax]=pwelch(fst_5(:,2),hann((Nfft/8)),[],Nfft,SR);
[fst_5_pwall,fst_5_fwall]=pwelch(fst_5(:,3),hann((Nfft/8)),[],Nfft,SR);
[fst_5_pfs,fst_5_ffs]=pwelch(fst_5(:,4),hann((Nfft/8)),[],Nfft,SR);

[fst_6_pmax,fst_6_fmax]=pwelch(fst_6(:,2),hann((Nfft/8)),[],Nfft,SR);
[fst_6_pwall,fst_6_fwall]=pwelch(fst_6(:,3),hann((Nfft/8)),[],Nfft,SR);
[fst_6_pfs,fst_6_ffs]=pwelch(fst_6(:,4),hann((Nfft/8)),[],Nfft,SR);

[fst_7_pmax,fst_7_fmax]=pwelch(fst_7(:,2),hann((Nfft/8)),[],Nfft,SR);
[fst_7_pwall,fst_7_fwall]=pwelch(fst_7(:,3),hann((Nfft/8)),[],Nfft,SR);
[fst_7_pfs,fst_7_ffs]=pwelch(fst_7(:,4),hann((Nfft/8)),[],Nfft,SR);

[fst_8_pmax,fst_8_fmax]=pwelch(fst_8(:,2),hann((Nfft/8)),[],Nfft,SR);
[fst_8_pwall,fst_8_fwall]=pwelch(fst_8(:,3),hann((Nfft/8)),[],Nfft,SR);
[fst_8_pfs,fst_8_ffs]=pwelch(fst_8(:,4),hann((Nfft/8)),[],Nfft,SR);

[fst_9_pmax,fst_9_fmax]=pwelch(fst_9(:,2),hann((Nfft/8)),[],Nfft,SR);
[fst_9_pwall,fst_9_fwall]=pwelch(fst_9(:,3),hann((Nfft/8)),[],Nfft,SR);
[fst_9_pfs,fst_9_ffs]=pwelch(fst_9(:,4),hann((Nfft/8)),[],Nfft,SR);

[fst_10_pmax,fst_10_fmax]=pwelch(fst_10(:,2),hann((Nfft/8)),[],Nfft,SR);
[fst_10_pwall,fst_10_fwall]=pwelch(fst_10(:,3),hann((Nfft/8)),[],Nfft,SR);
[fst_10_pfs,fst_10_ffs]=pwelch(fst_10(:,4),hann((Nfft/8)),[],Nfft,SR);



figure(4)

loglog(fst_3_ffs,fst_3_pfs,'linewidth',1.5);hold on;set(gca,'FontSize',16);title('u-{fs}-893mm; fst');
loglog(fst_4_ffs,fst_4_pfs,'linewidth',1.5);
loglog(fst_5_ffs,fst_5_pfs,'linewidth',1.5);
loglog(fst_6_ffs,fst_6_pfs,'linewidth',1.5);
loglog(fst_7_ffs,fst_7_pfs,'linewidth',1.5);
loglog(fst_8_ffs,fst_8_pfs,'linewidth',1.5);
loglog(fst_9_ffs,fst_9_pfs,'linewidth',1.5);
loglog(fst_10_ffs,fst_10_pfs,'linewidth',1.5);
grid on;xlabel('Hz');ylabel('\Phi_{uu}');
legend('3ms','4ms','5ms','6ms','7ms','8ms','9ms','10ms');


figure(5)

semilogx(fst_3_ffs,fst_3_pfs.*fst_3_ffs,'linewidth',2);hold on;set(gca,'FontSize',16);title('u-{fs}-893mm; fst');hold on;
semilogx(fst_4_ffs,fst_4_pfs.*fst_4_ffs,'linewidth',2);
semilogx(fst_5_ffs,fst_5_pfs.*fst_5_ffs,'linewidth',2);
semilogx(fst_6_ffs,fst_6_pfs.*fst_6_ffs,'linewidth',2);
semilogx(fst_7_ffs,fst_7_pfs.*fst_7_ffs,'linewidth',2);
semilogx(fst_8_ffs,fst_8_pfs.*fst_8_ffs,'linewidth',2);
semilogx(fst_9_ffs,fst_9_pfs.*fst_9_ffs,'linewidth',2);
semilogx(fst_10_ffs,fst_10_pfs.*fst_10_ffs,'linewidth',2);grid on;
grid on;xlabel('Hz');ylabel('f*\Phi_{uu}')
legend('3ms','4ms','5ms','6ms','7ms','8ms','9ms','10ms');


figure(6)

loglog(fst_3_fwall,fst_3_pwall,'linewidth',1.5);hold on;set(gca,'FontSize',16);title('u-{wall}-893mm; fst')
loglog(fst_4_fwall,fst_4_pwall,'linewidth',1.5);
loglog(fst_5_fwall,fst_5_pwall,'linewidth',1.5);
loglog(fst_6_fwall,fst_6_pwall,'linewidth',1.5);
loglog(fst_7_fwall,fst_7_pwall,'linewidth',1.5);
loglog(fst_8_fwall,fst_8_pwall,'linewidth',1.5);
loglog(fst_9_fwall,fst_9_pwall,'linewidth',1.5);
loglog(fst_10_fwall,fst_10_pwall,'linewidth',1.5);
grid on;xlabel('Hz');ylabel('\Phi_{uu}');
legend('3ms','4ms','5ms','6ms','7ms','8ms','9ms','10ms');


figure(7)

semilogx(fst_3_fwall,fst_3_pwall.*fst_3_fwall,'linewidth',2);hold on;set(gca,'FontSize',16);title('u-{wall}-893mm; fst');
semilogx(fst_4_fwall,fst_4_pwall.*fst_4_fwall,'linewidth',2);
semilogx(fst_5_fwall,fst_5_pwall.*fst_5_fwall,'linewidth',2);
semilogx(fst_6_fwall,fst_6_pwall.*fst_6_fwall,'linewidth',2);
semilogx(fst_7_fwall,fst_7_pwall.*fst_7_fwall,'linewidth',2);
semilogx(fst_8_fwall,fst_8_pwall.*fst_8_fwall,'linewidth',2);
semilogx(fst_9_fwall,fst_9_pwall.*fst_9_fwall,'linewidth',2);grid on;
semilogx(fst_10_fwall,fst_10_pwall.*fst_10_fwall,'linewidth',2);
grid on;xlabel('Hz');ylabel('f*\Phi_{uu}');
legend('3ms','4ms','5ms','6ms','7ms','8ms','9ms','10ms');

figure(8)

loglog(fst_3_fmax,fst_3_pmax,'linewidth',1.5);hold on;set(gca,'FontSize',16);title('u-{max}-893mm; fst');
loglog(fst_4_fmax,fst_4_pmax,'linewidth',1.5);
loglog(fst_5_fmax,fst_5_pmax,'linewidth',1.5);
loglog(fst_6_fmax,fst_6_pmax,'linewidth',1.5);
loglog(fst_7_fmax,fst_7_pmax,'linewidth',1.5);
loglog(fst_8_fmax,fst_8_pmax,'linewidth',1.5);
loglog(fst_9_fmax,fst_9_pmax,'linewidth',1.5);
loglog(fst_10_fmax,fst_10_pmax,'linewidth',1.5);
grid on;xlabel('Hz');ylabel('\Phi_{uu}');
legend('3ms','4ms','5ms','6ms','7ms','8ms','9ms','10ms');


figure(9)

semilogx(fst_3_fmax,fst_3_pmax.*fst_3_fmax,'linewidth',2);hold on;set(gca,'FontSize',16);title('u-{max}-893mm; fst');
semilogx(fst_4_fmax,fst_4_pmax.*fst_4_fmax,'linewidth',2);
semilogx(fst_5_fmax,fst_5_pmax.*fst_5_fmax,'linewidth',2);
semilogx(fst_6_fmax,fst_6_pmax.*fst_6_fmax,'linewidth',2);
semilogx(fst_7_fmax,fst_7_pmax.*fst_7_fmax,'linewidth',2);
semilogx(fst_8_fmax,fst_8_pmax.*fst_8_fmax,'linewidth',2);
semilogx(fst_9_fmax,fst_9_pmax.*fst_9_fmax,'linewidth',2);grid on;
semilogx(fst_10_fmax,fst_10_pmax.*fst_10_fmax,'linewidth',2);
grid on;xlabel('Hz');ylabel('f*\Phi_{uu}')
legend('3ms','4ms','5ms','6ms','7ms','8ms','9ms','10ms');



