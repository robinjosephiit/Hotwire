clc;clear all;
temp=importdata('1-2.80-0.00-0.00.dat');X=temp.data();clear temp;
%HW1
% n = 0.44;
% A=0.54045557;
% B=0.33556694;
% E_avg=X(:,2);

% HW2
n = 0.43;
A=1.04219179;
B=0.74096575;
E_avg=X(:,3);


% X(:,3)=(((E_avg(:)^2)-A)/B)^(1/n)
temp1(:)=E_avg(:).^2;
temp2(:)=(temp1(:)-A)/B;
temp3(:)=(temp2(:)).^(1/n);

X(:,3)=temp3(:);
Uinf=mean(X(:,3));
X(:,4)=X(:,3)-Uinf;

order=1;                      
fcut=3;  
SR=20000;
[p q]=butter(order,fcut/(SR/2),'high');


X(:,5)=filter(p,q,X(:,4));

Rms_filt=std(X(:,5),1);
Rms=std(X(:,4),1);

TI=(Rms/Uinf)*100
TI_filt=(Rms_filt/Uinf)*100


